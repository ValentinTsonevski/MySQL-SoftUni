DELIMITER $$ 
CREATE FUNCTION ufn_calculate_future_value(start_sum DECIMAL(19,4),Yearly_Interest_rate DOUBLE,years INT)
 RETURNS DECIMAL(19,4)
 DETERMINISTIC
 
 BEGIN
 DECLARE final_sum DECIMAL(19,4);
 SET final_sum := start_sum * POW((1 + Yearly_Interest_rate),years) ;
 RETURN final_sum;
 END$$