SET IDENTITY_INSERT MenuItems ON

MERGE INTO MenuItems AS Target
USING (VALUES
    (1,  1, 'Hot Ham and Cheese',       'Black forest ham and swiss cheese served on a pretzel roll',                           8.00),    
    (2,  1, 'Turkey and Gouda',         'Oven roasted turkey with gouda cheese on cibatta',                                     9.00),
    (3,  1, 'Classic Club',             'Black forest ham, oven roasted turkey, New York sharp cheddar and bacon on sourdough', 10.50),
    (10,  2, 'Cheese Pizza',            'Classic cheese pizza',                                                    7.00),
    (11,  2, 'Pepperoni',               'Classic pepperoni pizza',                                                 8.00),
    (12,  2, 'Sausage and Mushroom',    'Classic suasage and mushroom',                                            8.00),
    (13,  2, 'Margherita',              'Basil and tomatoes',                                                      8.00),
    (14,  2, 'Seafood',                 'Shrimp and crab meat',                                                   11.00),
    (15,  2, 'Combination',             'Pepperoni, Sausage and mushroom',                                        10.00),
    (81,  8, 'Classic Hamburger',       'Hamburger',                                            10.00),
    (82,  8, 'Classic Cheeseburger',    'Cheeseburer',                                        10.00),
    (83,  8, 'Bacon Cheeseburger',      'Bacon Cheeseburger',                                        10.00),
    (84,  8, 'Mushroom and Swiss',      'Muchroom and swiss',                                        10.00)
)
AS Source (ItemId, CafeId, Name, Description, Price)
ON Target.ItemId = Source.ItemId
    WHEN MATCHED THEN
        UPDATE
		    SET
            CafeId = Source.CafeId,
			Name = Source.Name,
			Description = Source.Description,
			Price = Source.Price
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (ItemId, CafeId, Name, Description, Price)
        VALUES (ItemId, CafeId, Name, Description, Price);


DECLARE @nextMenuItemId INT;
SELECT @nextMenuItemId = (
        SELECT max(ItemId)
            FROM MenuItems
	) ;


DBCC CHECKIDENT (MenuItems, RESEED, @nextMenuItemId)

SET IDENTITY_INSERT MenuItems OFF


        