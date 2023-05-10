import logo from './logo.svg';
import './App.css';
import React, { useEffect, useState } from 'react';
import ViewTable from './ViewTable/ViewTable';
import InsertForm from './InsertForms/InsertForm';

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
    <div className='header'> Sustainable Solutions Campaign
    <div className='main-view'>
      <div className='response-title'>Submit A Response</div>
      <InsertForm/>
      <div>
      <div className='view-title'>Select A View</div>
      <select id="view" value={selectedView} onChange={handleViewChange}>
        <option value="">-- Select a view --</option>
        <option value="http://localhost:5000/api/instructor-course-view">Instructor Courses</option>
        <option value="http://localhost:5000/api/nonstudent-view">Non-Student Survey Count</option>
        <option value="http://localhost:5000/api/professor-enrollment-count-view">Professor Enrollment Count</option>
        <option value="http://localhost:5000/api/student-demographics-view">Student Demographics</option>
        <option value="http://localhost:5000/api/student-enrollment-view">Student Enrollment</option>
        <option value="http://localhost:5000/api/student-info-view">Student Info</option>
        <option value="http://localhost:5000/api/survey-results-view">Survey Results</option>

      </select>
      {loading ? <p className='loading'>Loading...</p> : jsonData.length > 0 ? <ViewTable data={jsonData} /> : null}
      </div>
    </div>
    </div>
    
  );
}

export default App;
