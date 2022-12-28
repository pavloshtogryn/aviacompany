use aviacompany

--1
SELECT * FROM Ticket
JOIN Client ON Ticket.ClientID = Client.ClientID

--2
SELECT TOP (5) * FROM Ticket
ORDER BY SellDate DESC

--3
SELECT TOP (3) *
FROM 
(SELECT Client.ClientID, (COUNT(TicketID)/ (DATEDIFF(day, MIN(Ticket.SellDate), MAX(Ticket.SellDate)) + 1) ) AS TicketsPerDay --added +1 day to days count to avoid dividing by zero
FROM Ticket
JOIN Client ON Ticket.ClientID = Client.ClientID
GROUP BY (Client.ClientID) 
) tpd
ORDER BY tpd.TicketsPerDay DESC