UPDATE tbl_em_employeedetails
SET tbl_em_employeedetails.ID = tbl_em_employeedetails.New_ID
FROM (
      SELECT ID, ROW_NUMBER() OVER (ORDER BY [ID]) AS New_ID

      FROM tbl_em_employeedetails
      ) tbl_em_employeedetails