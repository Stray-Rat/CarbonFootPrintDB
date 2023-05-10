import React from 'react';
import './vt.css';
function ViewTable(props) {
  const keys = Object.keys(props.data[0]);

  return (
    <div className='table-container'>
    <table>
      <thead>
        <tr>
          {keys.map((key) => (
            <th key={key}>{key}</th>
          ))}
        </tr>
      </thead>
      <tbody>
        {props.data.map((item) => (
          <tr key={item.id}>
            {keys.map((key) => (
              <td key={key}>{item[key]}</td>
            ))}
          </tr>
        ))}
      </tbody>
    </table>
    </div>
  );
}

export default ViewTable;