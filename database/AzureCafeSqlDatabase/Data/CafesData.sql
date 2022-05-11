SET IDENTITY_INSERT Cafes ON

MERGE INTO Cafes AS Target
USING (VALUES
    (1,  'Visual Sandwich',             'Your favorite sandwiches since version 2003',                             'Building 18'),
    (2,  'PizzaPoint',                  'Wood fired pizzas',                                                       'Building 7'),
    (3,  'Seafood#',                    'Classic Chicago Dogs and Italian Beef',                                   'Building 4'),
    (4,  'Sushi Server',                'You love sushi.  Need we say more',                                       'Building 25'),
    (5,  'OneNoodle',                   'Asian stir fry bowls made to order',                                      'Building 18'),
    (6,  'Spaghetti Development Kit',   'Build your own pasta creations',                                          'Building 3'),
    (7,  'Ice Cream Explorer',          'Surf your favorite flavors of ice cream and frozen yogurt',               'Building 9'),
    (8,  'GrillHub',                    'Open source grilled favorites',                                           'Building 31')
)
AS Source (CafeId, Name, Description, Location)
ON Target.CafeId = Source.CafeId
    WHEN MATCHED THEN
        UPDATE
		    SET
			Name = Source.Name,
			Description = Source.Description,
			Location = Source.Location
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (CafeId, Name, Description, Location)
        VALUES (CafeId, Name, Description, Location);


DECLARE @nextCafeId INT;
SELECT @nextCafeId = (
        SELECT max(CafeId)
            FROM Cafes
	) ;


DBCC CHECKIDENT (Cafes, RESEED, @nextCafeId)

SET IDENTITY_INSERT Cafes OFF


 