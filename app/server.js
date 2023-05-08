const express = require('express');
const path = require('path');
const app = express();
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

app.use(express.static(path.join(__dirname, 'client/public')));

app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname+'/client/public/index.html'));
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});