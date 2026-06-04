use sql_project;
#1.	Select all bookings where revenue is greater than 14,500
select * from bookings where Revenue>14500;
#2.	Retrieve customers who registered after '2026-03-01'
select * from customers where Registration_Date > 2026-03-01;
#3.	Select hotels with rating greater than 4.5
select * from hotels where Rating > 4.5;
#4.	Get bookings where check-out date is between '2026-06-01' and '2026-07-01'
select * from bookings where Check_Out_Date between '2026-06-01'and '2026-07-01';
#5.	Retrieve bookings where room type = 'Suite' and revenue > 12,000
select Booking_ID, Room_Type, Revenue from booking where  Room_Type = 'Suite' and Revenue > 12000;
#6.	Select customers from Chennai or Coimbatore
select * from customers where City = 'Chennai' or City = 'Coimbatore';
#7.	Get hotel names that start with 'C'
select * from hotels where Hotel_Name like 'C%';
#8.	Select bookings where payment method is 'UPI' (using JOIN);
select b.booking_id ,p.payment_method from bookings b inner join payments p 
on b.customer_id = p.customer_id where p.payment_method = 'UPI';
#9.	Retrieve bookings where revenue is equal to 5000
select * from bookings where revenue <=5000;
#10.Select customers who registered in the month of January
select * from customers where month(Regestration_Date)=1;
#11.Select customer name and booking revenue where revenue > 10,000
select c.customer_name,b.revenue from customers c inner join bookings b 
on c.customer_id = b.customer_id where b.revenue > 14000;
#12.Get hotel name and booking room type where room type = 'Deluxe' 
select h.hotel_name,b.room_type from hotels h inner join bookings b 
on h.hotel_id = b.hotel_id where room_type = 'Deluxe';
#13.Retrieve bookings where payment status = 'Pending' with customer name
select c.customer_name,c.city,p.payment_status from customers c right join payments p
 on c.customer_id = p.customer_id where payment_status= 'pending';
#14.Select customers who booked hotels in a city different from their own city
select c.Customer_Name, h.Hotel_Name, h.Hotel_City from Customers c join Bookings b on c.Customer_ID = b.Customer_ID 
join Hotels h on b.Hotel_ID = h.Hotel_ID where c.City <> h.Hotel_City;  
#15.Get incompleted bookings with customer and hotel details
select b.booking_id, c.customer_name, h.hotel_name, p.payment_status
from bookings b join customers c on b.customer_id = c.customer_id join hotels h on b.hotel_id = h.hotel_id 
join payments p on c.customer_id = p.customer_id where p.payment_status = 'pending';
#16.Select bookings where hotel rating > 4.5
select c.customer_name,b.booking_id,h.hotel_name,h.rating from customers c join bookings b on c.customer_id = b.customer_id 
join hotels h on h.hotel_id = b.hotel_id where h.rating >4.5;
#17.Retrieve bookings where payment method = 'Cash'
select c.customer_name,p.payment_method from customers c join payments p on c.customer_id = p.customer_id 
where p.payment_method = 'cash';
#18.Select bookings where both customer and hotel belong to the same city
select c.Customer_Name, h.Hotel_Name, h.Hotel_City from Customers c join Bookings b on c.Customer_ID = b.Customer_ID 
join Hotels h on b.Hotel_ID = h.Hotel_ID where c.City = h.Hotel_City; 
#19.Get bookings where payment pending but booking revenue > 5,000
select b.booking_id ,p.payment_status,b.revenue from bookings b join payments p on p.customer_id = b.customer_id
where b.revenue > 12500 and p.payment_status = 'pending';
#20.Select customers who have bookings with revenue > 15,000
select c.customer_name,b.revenue from customers c join bookings b on c.customer_id = b.customer_id where b.revenue >14500;
#21.Find total bookings per customer where total bookings > 2
select c.customer_name, count(b.booking_id) as total_bookings from customers c join bookings b on c.customer_id = b.customer_id
group by c.customer_name having count(b.booking_id) >3;
#22.Get total revenue per hotel where revenue > 15,0000
select h.hotel_name , sum(b.revenue) as total_revenues from hotels h join bookings b on h.hotel_id = b.hotel_id 
group by h.hotel_name having sum(b.revenue)>150000;
#23.Calculate average revenue per hotel city where avg revenue > 7,000
select h.hotel_city,avg(b.revenue) as average_revenue from hotels h join bookings b on h.hotel_id = b.hotel_id 
group by h.hotel_city having avg(b.revenue) > 7000;
#24.Count bookings per day where bookings > 2
select b.booking_date , count(b.booking_id) as total_bookings from bookings b group by b.booking_date having count(b.booking_id)>2;
#25.Find customers with total spending > 25,000
select c.customer_name , sum(p.amount) as total_spending from  payments p join customers c on
c.customer_id = p.customer_id group by c.customer_name having sum(p.amount) > 25000;
#26.Get hotels with more than 3 Suite bookings
select h.hotel_name , count(*) from hotels h join bookings b on h.hotel_id = b.hotel_id
where b.room_type = 'suite' group by h.hotel_name having count(*)>3;
#27.Find payment methods used more than 5 times
select p.payment_method, count(p.payment_id) as total_usage from payments p
group by p.payment_method having count(p.payment_id) > 5;
#28.Get cities with more than 10 customers
select c.city,count(c.customer_id) as total_customers from customers c 
group by c.city having count(c.customer_id) > 10;
#29.Find hotels with rating > 4.2
select hotel_name,rating from hotels where rating >4.2;
#30.Count pending payments per customer where count > 2
select c.customer_name , count(p.payment_id) as pending_count from customers c join payments p on c.customer_id = p.customer_id
where p.payment_status = 'pending' group by c.customer_name having count(p.payment_id)> 2;
#31.Select top 5 bookings with highest revenue
select booking_id,revenue from bookings order by revenue desc limit 5;
#32.Get lowest 3 revenue bookings
select booking_id ,revenue from bookings order by revenue asc limit 3;
#33.Retrieve top 5 customers based on total spending
select c.customer_name ,p.amount from customers c join payments p on c.customer_id = p.customer_id order by p.amount desc limit 5;
#34.Select top 3 hotels with highest rating
select hotel_name,rating from hotels order by rating desc limit 3; 
#35.Get 2nd highest revenue booking using LIMIT OFFSET
select booking_id,revenue from bookings order by revenue desc limit 1 offset 1;
#36.Select customers whose total spending is greater than average spending
select c.customer_name , sum(p.amount) as total_spending from  payments p join customers c on
c.customer_id = p.customer_id group by c.customer_name having sum(p.amount) > 
(select avg(total_spending) from (select sum(p.amount) as total_spending from bookings b join payments p
on b.customer_id = p.customer_id group by b.customer_id) as average_spending);
#37.Get hotels earning more than average hotel revenue
select h.hotel_id,sum(b.revenue) as total_revenue from hotels h join bookings b on h.hotel_id = b.hotel_id 
group by h.hotel_id having sum(b.revenue) > (select avg(hotel_total) from (select sum(b.revenue) as hotel_total
from bookings b group by b.hotel_id) as avg_revenue);
#38.Retrieve bookings where revenue > average revenue
select c.customer_name,sum(b.revenue) as total_revenue from customers c join bookings b on c.customer_id = c.customer_id 
group by c.customer_name having sum(b.revenue) > (select avg(avg_revenue) from (select sum(b.revenue) as avg_revenue
from bookings b join customers c on c.customer_id = b.customer_id group by c.customer_name) as avg_revenue);
#39.Select customers who have no bookings
select c.customer_id,c.customer_name  from customers c left join bookings b on c.customer_id = b.customer_id
where b.booking_id is null;
#40.Select bookings with maximum revenue
select booking_id, hotel_id, customer_id, revenue from bookings
where revenue = (select max(revenue) from bookings); 
#41.Retrieve customers with highest number of bookings
select c.customer_id, c.customer_name, count(b.booking_id) as total_bookings from customers c
join bookings b on c.customer_id = b.customer_id group by c.customer_id, c.customer_name order by total_bookings desc limit 1;
#42.Select second highest earning hotel
select h.hotel_id, h.hotel_name, sum(b.revenue) as total_revenue from hotels h
join bookings b on h.hotel_id = b.hotel_id group by h.hotel_id, h.hotel_name
order by total_revenue desc limit 1 offset 1;
#43.Get bookings where revenue > customer’s average spending
select b.booking_id,b.customer_id ,b.revenue from bookings b where b.revenue > 
(select avg(p.amount)from payments p where p.customer_id = b.customer_id);
#45.Select customers who made only one booking
select b.customer_id,count(b.booking_id) as total_bookings from bookings b 
group by b.customer_id having count(b.booking_id)=1;
#45.Update payment status to 'Paid' where booking revenue > 10,000
update payments set payment_status = 'paid' where amount >10000;
select payment_id,amount,payment_status from payments;
#46.Delete bookings where revenue < 5000 and room type = 'Standard'
delete from bookings where revenue < 5000 and room_type = 'standard';
select booking_id,room_type,revenue from bookings;
# 47 Create a view for high revenue bookings
create view high_revenue_bookings as select booking_id,customer_id,revenue from bookings where revenue >10000;
select * from high_revenue_bookings;
#48.update the revenue of two bookings and use SAVEPOINT,ROLLBACK,COMMIT to manage the transaction
start transaction;
update bookings
set revenue = revenue + 100
where booking_id = 'BK1';
savepoint sp1;
update bookings
set revenue = revenue + 2000
where booking_id = 'BK2';
rollback to sp1 ;
commit;
select booking_id,revenue from bookings limit 2;
#49.Write a stored procedure to display all booking records between two given dates.
delimiter &&
create procedure bookingsdate(
    in start_date date,
    in end_date date
)
begin
  select booking_id, customer_id,booking_date, revenue
  from bookings
  where booking_date between start_date and end_date;
end &&
delimiter ;
call bookingsdate('2026-01-01','2026-02-02')
#50.Create a stored procedure to get hotels where rating > given value
delimiter &&
create procedure high_spending_customers(
    in min_amount decimal(10,2)
)
begin
  select c.customer_id, c.customer_name, sum(p.amount) as total_spent
  from customers c
  join payments p on c.customer_id = p.customer_id
  group by c.customer_id, c.customer_name
  having total_spent > min_amount
  order by total_spent desc;
end &&
delimiter ;
call high_spending_customers(5000);
  
  
         











