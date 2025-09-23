SELECT firstName, lastName, city, state 
FROM Person p
LEFT Join Address a ON p.personId = a.personId