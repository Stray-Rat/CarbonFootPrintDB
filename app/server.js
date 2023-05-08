const express = require('express');
const path = require('path');
const app = express();
const port = 5000;
const pool = require('./db');

console.log(pool);

app.get('/api/test', (req, res) => {
    res.send('Response');
});

app.get('/api/instructor-course-view', (req, res) => {
    const query = 'SELECT * FROM instructorcourses';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    })
});

app.get('/api/nonstudent-view', (req, res) => {
    const query = 'SELECT * FROM nonstudentsurveycount';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    })
});

app.get('/api/professor-enrollment-count-view', (req, res) => {
    const query = 'SELECT * FROM professorenrollmentcount';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    })
});

app.get('/api/student-demographics-view', (req, res) => {
    const query = 'SELECT * FROM studentdemographics';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    })
});

app.get('/api/student-enrollment-view', (req, res) => {
    const query = 'SELECT * FROM studentenrollment';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    })
});


app.get('/api/student-info-view', (req, res) => {
    const query = 'SELECT * FROM studentinfoview';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    })
});

app.get('/api/survey-results-view', (req, res) => {
    const query = 'SELECT * FROM surveyresults';
    pool.query(query, function(err, results, fields) {
        res.json(results);
    })
});

app.use(express.static(path.join(__dirname, 'client/public')));

app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname+'/client/public/index.html'));
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});