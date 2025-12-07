USE school;
-- Finding Rank of 2nd highest from all the class of all the schools
WITH RankedStudents AS (
    SELECT
        s.School_ID,
        s.Class,
        s.Student_ID,
        s.Overall_Marks,
        d.Native,
        DENSE_RANK() OVER (PARTITION BY s.School_ID, s.Class ORDER BY s.Overall_Marks DESC) AS rnk
    FROM
        Student_Information s
    JOIN
        Student_Demographics d ON s.Student_ID = d.Student_ID
    WHERE
        d.Native = 'Indian'
)
SELECT
    School_ID,
    Class,
    Student_ID,
    Overall_Marks
FROM
    RankedStudents
WHERE
    rnk = 2
ORDER BY
    School_ID,
    Class;


