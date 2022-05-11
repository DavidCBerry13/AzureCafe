CREATE TABLE CafeReviewPhotos
(
    PhotoId           INT IDENTITY       NOT NULL,
	ReviewId          INT                NOT NULL,
	PhotoPath         VARCHAR(80)        NOT NULL,
	ThumbnailPath     VARCHAR(80)        NULL,
	PhotoComment      VARCHAR(256)       NOT NULL,
	CONSTRAINT PK_CafeReviewPhotos 
	    PRIMARY KEY (PhotoId),
	CONSTRAINT FK_CafeReviewPhotos_ReviewId
	    FOREIGN KEY (ReviewId) REFERENCES CafeReviews (ReviewId)
);
