/* Query 1 - query used for first insight */
SELECT G.Name AS GenreName, COUNT(G.Name) AS TopGenreOccurrence
FROM Customer C
Join Invoice I
ON C.CustomerId = I.CustomerId
JOIN InvoiceLine IL
On I.InvoiceId = IL.InvoiceId
Join Track T
ON IL.TrackId=T.TrackId
Join Genre G
On T.GenreId= G.GenreId
Group by 1
ORDER BY 2 DESC
LIMIT 10


/* Query 2 - query used for second insight */
SELECT AR.Name AS TopArtist , COUNT(G.name) AS ArtistPerGenre
FROM Artist AR
JOIN Album AL
ON AL.ArtistId = AR.ArtistId
JOIN Track T
ON AL.AlbumId = T.AlbumId
JOIN Genre G
ON T.GenreId = G.GenreId
WHERE G.Name = 'Rock'
GROUP BY TopArtist
ORDER BY 2 DESC
LIMIT 10


/* Query 3 - query used for third insight */
SELECT AR.Name AS TopArtist , COUNT(PT.PlaylistId) AS ArtistPerTrack
FROM Artist AR
JOIN Album AL
ON AL.ArtistId = AR.ArtistId
JOIN Track T
ON AL.AlbumId = T.AlbumId
JOIN Genre G
ON T.GenreId = G.GenreId
JOIN PlaylistTrack PT
ON PT.TrackId = T.TrackId
WHERE G.Name = 'Rock'
GROUP BY TopArtist
ORDER BY 2 DESC
LIMIT 10


/* Query 4 - query used for fourth insight */
SELECT T.Name AS TrackName, COUNT(PT.PlaylistId) AS TrackOccurrence
FROM PlaylistTrack PT
Join Track T
ON PT.TrackId = T.TrackId
JOIN Genre G
ON T.GenreId = G.GenreId
WHERE G.Name = 'Rock'
GROUP BY 1
ORDER BY 2 DESC, 1
LIMIT 20


/* Query 5 - query used for fifth insight */
SELECT I.BillingCountry CountryName, COUNT(G.Name) RockPerCountry
FROM Invoice I
JOIN InvoiceLine IL
ON I.InvoiceId = IL.InvoiceId
JOIN Track T
ON T.TrackId = IL.TrackId
JOIN Genre G
ON G.GenreId = T.GenreId
WHERE G.Name = 'Rock'
GROUP BY 1
ORDER BY 2 DESC
