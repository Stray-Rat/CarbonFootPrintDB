import logo from './logo.svg';
import './App.css';
import React, { useEffect, useState } from 'react';
import ViewTable from './ViewTable/ViewTable';

function App() {
  const [selectedView, setSelectedView] = useState('');
  const [jsonData, setJsonData] = useState([]);
  const [loading, setLoading] = useState(false);

  const handleViewChange = (event) => {
    setSelectedView(event.target.value);
  };

  useEffect(() => {
    if (selectedView) {
      setLoading(true); // Set loading state to true
      fetch(`${selectedView}`)
        .then(response => response.json())
        .then(data => {
          setJsonData(data);
          setLoading(false); // Set loading state to false
          console.log(data); // Log the updated jsonData state
        })
        .catch(error => console.error(error));
    }
  }, [selectedView]);

  return (
    <div>
      <label htmlFor="view">Select a view:</label>
      <select id="view" value={selectedView} onChange={handleViewChange}>
        <option value="">-- Select a view --</option>
        <option value="http://localhost:5000/api/instructor-course-view">Instruct Courses</option>
        <option value="http://localhost:5000/api/nonstudent-view">Non-Student Survey Count</option>
        <option value="http://localhost:5000/api/professor-enrollment-count-view">Professor Enrollment Count</option>
        <option value="http://localhost:5000/api/student-demographics-view">Student Demographics</option>
        <option value="http://localhost:5000/api/student-enrollment-view">Student Enrollment</option>
        <option value="http://localhost:5000/api/student-info-view">Student Info</option>
        <option value="http://localhost:5000/api/survey-results-view">Survey Results</option>

      </select>
      {loading ? <p>Loading...</p> : jsonData.length > 0 ? <ViewTable data={jsonData} /> : null}
      
    </div>
  );
}

export default App;
