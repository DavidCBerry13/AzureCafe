

DECLARE @today DATE;
SET @today = GetDate()


INSERT INTO CafeReviews (CafeId, ReviewDate, ReviewerName, Rating, Comments) VALUES 
    (1, DATEADD(day, -14, @today), 'Kendra', 5, 'Very good sandwich'),
    (1, DATEADD(day, -10, @today), 'Scott', 5, 'So good I ate ordered a second one'),
    (1, DATEADD(day, -8, @today), 'Pine', 4, 'Pretty good but I have had better'),
    (1, DATEADD(day, -3, @today), 'Bill', 3, 'Too much mayo on my sandwich!');

INSERT INTO CafeReviews (CafeId, ReviewDate, ReviewerName, Rating, Comments) VALUES 
    (2, DATEADD(day, -23, @today), 'Barb', 5, 'This is my go to spot for lunch when on campus'),
    (2, DATEADD(day, -15, @today), 'Kraig', 5, 'Really liked the margherita pizza'),
    (2, DATEADD(day, -10, @today), 'David', 3, 'We''ve got way better pizza in Chicago'),
    (2, DATEADD(day, -6, @today), 'Steven', 5, 'Much better than what we have back in Scotland');

INSERT INTO CafeReviews (CafeId, ReviewDate, ReviewerName, Rating, Comments) VALUES 
    (2, DATEADD(day, -21, @today), 'Maggie', 4, 'Pretty good burger'),
    (2, DATEADD(day, -14, @today), 'Kyle', 5, 'The double is the only way to go'),
    (2, DATEADD(day, -9, @today), 'James', 3, 'They put mustard on my burger and I hate mustard'),
    (2, DATEADD(day, -2, @today), 'Cam', 3, 'We know how to make burgers in Kansas City.  We could teach you');