
SELECT m.EmployeeId AS ManagerId,
       m.FirstName ||" "|| m.LastName Manager,
       COUNT (e.EmployeeId) AS number_of_employees,
             m.Title
FROM Employee e
JOIN Employee m ON e.ReportsTo = m.EmployeeId
GROUP BY m.EmployeeId,
         m.FirstName,
         m.LastName	
		 
SELECT i.CustomerId, c.FirstName ||" "|| c.LastName Name, sum(i.Total) TotalPaid
FROM Invoice i JOIN Customer c ON i.CustomerId = c.CustomerId
GROUP BY i.CustomerId, Name
ORDER BY TotalPaid DESC
LIMIT 10

SELECT a.ArtistId, a.Name, count(*) Songs, g.Name Genre
FROM Artist a JOIN Album al ON a.ArtistId = al.ArtistId
JOIN Genre g ON g.GenreId = t.GenreId
JOIN Track t ON t.AlbumId = al.AlbumId
-- WHERE g.Name = "Rock"
GROUP BY a.ArtistId, a.Name, g.Name 
ORDER BY 3 DESC, g.Name LIMIT 10;

SELECT a.Name, sum(t.UnitPrice*(SELECT count(*) 
FROM InvoiceLine 
GROUP BY TrackId
)) AmountSpent
FROM Artist a JOIN Album al ON a.ArtistId = al.ArtistId
JOIN Track t ON t.AlbumId = al.AlbumId
JOIN Genre g ON g.GenreId = t.GenreId
JOIN InvoiceLine l ON l.TrackId = t.TrackId
JOIN Invoice i ON i.InvoiceId = l.InvoiceId
JOIN Customer c ON c.CustomerId = i.CustomerId
GROUP BY a.Name
ORDER BY 2 DESC
LIMIT 5;

