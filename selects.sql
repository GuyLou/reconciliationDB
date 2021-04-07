/*
example values to set the variables with
*/
SET @from_date = '2021-01-01';
SET @to_date = '2021-01-01';
SET @rectype = 1;

SELECT

	a.activity_id,
	a.activity_datetime,
	cp.counterpart_id,
	cp.counterpart_name,
	p.product_name,
	a.quantity,
	t.tariff_per_scale AS tariff,
	a.quantity * t.tariff_per_scale AS subtotal


FROM
	activity a
	INNER JOIN counterparts cp ON cp.counterpart_id = a.counterpart_id
	INNER JOIN products p ON p.product_id = a.product_id
	INNER JOIN tariffs t ON t.product_id = p.product_id AND (t.tariff_to_date IS NULL OR t.tariff_to_date > @to_date)
		AND cp.reconciliation_model_id = t.reconciliation_model_id
WHERE
	a.activity_datetime BETWEEN @from_date AND @to_date
	AND cp.reconciliation_model_id = @rectype
;

-- totals, per counterpart, per period

SELECT

	cp.counterpart_id,
	cp.counterpart_name,
	SUM(a.quantity * t.tariff_per_scale) AS total


FROM
	activity a
	INNER JOIN counterparts cp ON cp.counterpart_id = a.counterpart_id
	INNER JOIN products p ON p.product_id = a.product_id
	INNER JOIN tariffs t ON t.product_id = p.product_id AND (t.tariff_to_date IS NULL OR t.tariff_to_date > @to_date)
		AND cp.reconciliation_model_id = t.reconciliation_model_id
WHERE
	a.activity_datetime BETWEEN @from_date AND @to_date
	AND cp.reconciliation_model_id = @rectype
GROUP BY
	cp.counterpart_id,
	p.product_id
;

SELECT

	cp.counterpart_id,
	cp.counterpart_name,
	p.product_name,
	SUM(a.quantity * t.tariff_per_scale) AS total


FROM
	activity a
	INNER JOIN counterparts cp ON cp.counterpart_id = a.counterpart_id
	INNER JOIN products p ON p.product_id = a.product_id
	INNER JOIN tariffs t ON t.product_id = p.product_id AND (t.tariff_to_date IS NULL OR t.tariff_to_date > @to_date)
		AND cp.reconciliation_model_id = t.reconciliation_model_id
WHERE
	a.activity_datetime BETWEEN @from_date AND @to_date
	AND cp.reconciliation_model_id = @rectype
GROUP BY
	cp.counterpart_id,
	p.product_id
;