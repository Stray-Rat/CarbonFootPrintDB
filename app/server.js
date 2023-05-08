const express = require('express');
const path = require('path');
const app = express();
app.use(express.json());

const port = 5000;
const pool = require('./db');

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});



console.log(pool);

app.get('/api/test', (req, res) => {
    res.send('Response');
});

app.get('/api/instructor-course-view', (req, res) => {
    const query = 'SELECT * FROM instructorcourses';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    });
    console.log('instructor course query');
});

app.get('/api/nonstudent-view', (req, res) => {
    const query = 'SELECT * FROM nonstudentsurveycount';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    });
    console.log('nonstudent view query');
});

app.get('/api/professor-enrollment-count-view', (req, res) => {
    const query = 'SELECT * FROM professorenrollmentcount';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    });
    console.log('professor enrollment query');
});

app.get('/api/student-demographics-view', (req, res) => {
    const query = 'SELECT * FROM studentdemographics';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    });
    console.log('student demographics query');
});

app.get('/api/student-enrollment-view', (req, res) => {
    const query = 'SELECT * FROM studentenrollment';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    });
    console.log('student enrollment query');
});


app.get('/api/student-info-view', (req, res) => {
    const query = 'SELECT * FROM studentinfoview';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    });
    console.log('student info view');
});

app.get('/api/survey-results-view', (req, res) => {
    const query = 'SELECT * FROM surveyresults';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    });
    console.log('survey results view');
});

app.post('/api/insert-student', (req, res) => {
    const { id, name, major  } = req.body;
    const query = 'INSERT INTO Students (StudentID, StudentName, StudentMajor) VALUES (?, ?, ?)';
    const values = [id, name, major];
  
    pool.query(query, values, (error, results) => {
        if (error) {
            console.error(error);
            res.status(500).send('Error inserting into database');
        } else {
            console.log(results);
            res.send('Inserted successfully');
        }
    });
});

app.post('/api/insert-course', (req, res) => {
    const { id, name } = req.body;
    const query = 'INSERT INTO Courses (CourseID, CourseName) VALUES (?, ?)';
    const values = [id, name];
  
    pool.query(query, values, (error, results) => {
        if (error) {
            console.error(error);
            res.status(500).send('Error inserting into database');
        } else {
            console.log(results);
            res.send('Inserted successfully');
        }
    });
});

app.post('/api/insert-enrollments', (req, res) => {
    const { enrollment, student, course, instructor, date  } = req.body;
    const query = 'INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, InstructorID, EnrollmentDate) VALUES (?, ?, ?, ?, ?)';
    const values = [enrollment, student, course, instructor, date];
  
    pool.query(query, values, (error, results) => {
        if (error) {
            console.error(error);
            res.status(500).send('Error inserting into database');
        } else {
            console.log(results);
            res.send('Inserted successfully');
        }
    });
});

app.post('/api/insert-roles', (req, res) => {
    const { id, name } = req.body;
    const query = 'INSERT INTO Roles (RoleID, RoleName) VALUES (?, ?)';
    const values = [id, name];
  
    pool.query(query, values, (error, results) => {
        if (error) {
            console.error(error);
            res.status(500).send('Error inserting into database');
        } else {
            console.log(results);
            res.send('Inserted successfully');
        }
    });
});

app.post('/api/insert-demographics', (req, res) => {
    const { id, age, gender, ethnicity, address } = req.body;
    const query = 'INSERT INTO Demographics (StudentID, Age, Gender, Ethnicity, Address) VALUES (?, ?, ?, ?, ?)';
    const values = [id, age, gender, ethnicity, address];
  
    pool.query(query, values, (error, results) => {
        if (error) {
            console.error(error);
            res.status(500).send('Error inserting into database');
        } else {
            console.log(results);
            res.send('Inserted successfully');
        }
    });
});

app.post('/api/insert-survey', (req, res) => {
    const { respondent, role, student, isStudent, isVolunteer, isProfessor, susGarden, cali, argo, scale, time } = req.body;
    const query = 'INSERT INTO SurveyResponse (RespondentID, RoleID, studentID, IsStudent, IsVolunteer, IsProfessor, SustainableGardening, CaliforniaNativeGarden, ArgoHoodKnowledge, ReducingFootprintScale, Timestamp) VALUES (?, ?, ?, ?, ?, ?, ? ,? ,? ,? ,?)';
    const values = [respondent, role, student, isStudent, isVolunteer, isProfessor, susGarden, cali, argo, scale, time];
  
    pool.query(query, values, (error, results) => {
        if (error) {
            console.error(error);
            res.status(500).send('Error inserting into database');
        } else {
            console.log(results);
            res.send('Inserted successfully');
        }
    });
});

app.post('/api/insert-instructor', (req, res) => {
    const { id, name } = req.body;
    const query = 'INSERT INTO instructors (InstructorID, InstructorName) VALUES (?, ?)';
    const values = [id, name];
  
    pool.query(query, values, (error, results) => {
        if (error) {
            console.error(error);
            res.status(500).send('Error inserting into database');
        } else {
            console.log(results);
            res.send('Inserted successfully');
        }
    });
});



app.use(express.static(path.join(__dirname, 'client/public')));

app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname+'/client/public/index.html'));
});

app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});