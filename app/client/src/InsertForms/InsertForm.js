import React, { useState } from 'react';
import './if.css';

function Student() {
    const [id, setID] = useState('');
    const [name, setName] = useState('');
    const [major, setMajor] = useState('');
    function handleSubmit(event) {
        event.preventDefault();

        const formData = new FormData();
        formData.append('id', id);
        formData.append('name', name);
        formData.append('major', major);

        fetch('http://localhost:5000/api/insert-student', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ id, name, major })
        })
            .then(response => {
                if (response.ok) {
                    console.log('Data inserted successfully');
                } else {
                    console.error('Error inserting data');
                }
            })
            .catch(error => {
                console.error(error);
            });
    }

    return (
        <form onSubmit={handleSubmit}>
            <label>
                Student ID:
                <input type="text" value={id} onChange={event => setID(event.target.value)} />
            </label>
            <label>
                Student Name:
                <input type="text" value={name} onChange={event => setName(event.target.value)} />
            </label>
            <label>
                Student Major:
                <input type="text" value={major} onChange={event => setMajor(event.target.value)} />
            </label>
            <button type="submit">Submit</button>
        </form>
    );
}

function Course() {
    const [id, setID] = useState('');
    const [name, setName] = useState('');

    function handleSubmit(event) {
        event.preventDefault();

        const formData = new FormData();
        formData.append('id', id);
        formData.append('name', name);

        fetch('http://localhost:5000/api/insert-course', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ id, name})
        })
            .then(response => {
                if (response.ok) {
                    console.log('Data inserted successfully');
                } else {
                    console.error('Error inserting data');
                }
            })
            .catch(error => {
                console.error(error);
            });
    }

    return (
        <form onSubmit={handleSubmit}>
            <label>
                Course ID:
                <input type="text" value={id} onChange={event => setID(event.target.value)} />
            </label>
            <label>
                Course Name:
                <input type="text" value={name} onChange={event => setName(event.target.value)} />
            </label>
            <button type="submit">Submit</button>
        </form>
    );
}

function Instructor() {
    const [id, setID] = useState('');
    const [name, setName] = useState('');

    function handleSubmit(event) {
        event.preventDefault();

        const formData = new FormData();
        formData.append('id', id);
        formData.append('name', name);

        fetch('http://localhost:5000/api/insert-instructor', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ id, name})
        })
            .then(response => {
                if (response.ok) {
                    console.log('Data inserted successfully');
                } else {
                    console.error('Error inserting data');
                }
            })
            .catch(error => {
                console.error(error);
            });
    }

    return (
        <form onSubmit={handleSubmit}>
            <label>
                Instructor ID:
                <input type="text" value={id} onChange={event => setID(event.target.value)} />
            </label>
            <label>
                Instructor Name:
                <input type="text" value={name} onChange={event => setName(event.target.value)} />
            </label>
            <button type="submit">Submit</button>
        </form>
    );
}

function Enrollment() {
    const [enrollment, setEnrollment] = useState('');
    const [student, setStudent] = useState('');
    const [course, setCourse] = useState('');
    const [instructor, setInstructor] = useState('');
    const [date, setDate] = useState('');

    function handleSubmit(event) {
        event.preventDefault();

        const formData = new FormData();
        formData.append('enrollment', enrollment);
        formData.append('student', student);
        formData.append('course', course);
        formData.append('instructor', instructor);
        formData.append('date', date);




        fetch('http://localhost:5000/api/insert-enrollments', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ enrollment, student, course, instructor, date})
        })
            .then(response => {
                if (response.ok) {
                    console.log('Data inserted successfully');
                } else {
                    console.error('Error inserting data');
                }
            })
            .catch(error => {
                console.error(error);
            });
    }

    return (
        <form onSubmit={handleSubmit}>
            <label>
                Enrollment ID:
                <input type="text" value={enrollment} onChange={event => setEnrollment(event.target.value)} />
            </label>
            <label>
                Student ID:
                <input type="text" value={student} onChange={event => setStudent(event.target.value)} />
            </label>
            <label>
                Course ID:
                <input type="text" value={course} onChange={event => setCourse(event.target.value)} />
            </label>
            <label>
                Instructor ID:
                <input type="text" value={instructor} onChange={event => setInstructor(event.target.value)} />
            </label>
            <label>
                Enrollment Date:
                <input type="text" value={date} onChange={event => setDate(event.target.value)} />
            </label>
            <button type="submit">Submit</button>
        </form>
    );
}

function Roles() {
    const [id, setID] = useState('');
    const [name, setName] = useState('');

    function handleSubmit(event) {
        event.preventDefault();

        const formData = new FormData();
        formData.append('id', id);
        formData.append('name', name);

        fetch('http://localhost:5000/api/insert-roles', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ id, name})
        })
            .then(response => {
                if (response.ok) {
                    console.log('Data inserted successfully');
                } else {
                    console.error('Error inserting data');
                }
            })
            .catch(error => {
                console.error(error);
            });
    }

    return (
        <form onSubmit={handleSubmit}>
            <label>
                Role ID:
                <input type="text" value={id} onChange={event => setID(event.target.value)} />
            </label>
            <label>
                Role Name:
                <input type="text" value={name} onChange={event => setName(event.target.value)} />
            </label>
            <button type="submit">Submit</button>
        </form>
    );
}

function Demographics() {
    const [id, setID] = useState('');
    const [age, setAge] = useState('');
    const [gender, setGender] = useState('');
    const [ethnicity, setEthnicity] = useState('');
    const [address, setAddress] = useState('');

    function handleSubmit(event) {
        event.preventDefault();

        const formData = new FormData();
        formData.append('id', id);
        formData.append('age', age);
        formData.append('gender', gender);
        formData.append('ethnicity', ethnicity);
        formData.append('address', address);



        fetch('http://localhost:5000/api/insert-demographics', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({id, age, gender, ethnicity, address})
        })
            .then(response => {
                if (response.ok) {
                    console.log('Data inserted successfully');
                } else {
                    console.error('Error inserting data');
                }
            })
            .catch(error => {
                console.error(error);
            });
    }

    return (
        <form onSubmit={handleSubmit}>
            <label>
                Student ID:
                <input type="text" value={id} onChange={event => setID(event.target.value)} />
            </label>
            <label>
                Age:
                <input type="text" value={age} onChange={event => setAge(event.target.value)} />
            </label>
            <label>
                Gender:
                <input type="text" value={gender} onChange={event => setGender(event.target.value)} />
            </label>
            <label>
                Ethnicity:
                <input type="text" value={ethnicity} onChange={event => setEthnicity(event.target.value)} />
            </label>
            <label>
                Address:
                <input type="text" value={address} onChange={event => setAddress(event.target.value)} />
            </label>
            
            <button type="submit">Submit</button>
        </form>
    );
}

function Survey() {
    const [respondent, setRespondent] = useState('');
    const [role, setRole] = useState('');
    const [student, setStudent] = useState('');
    const [isStudent, setIsStudent] = useState('');
    const [isVolunteer, setIsVolunteer] = useState('');
    const [isProfessor, setIsProfessor] = useState('');
    const [susGarden, setSusGarden] = useState('');
    const [cali, setCali] = useState('');
    const [argo, setArgo] = useState('');
    const [scale, setScale] = useState('');
    const [time, setTime] = useState('');

    function handleSubmit(event) {
        event.preventDefault();

        const formData = new FormData();
        formData.append('respondent', respondent);
        formData.append('role', role);
        formData.append('student', student);
        formData.append('isStudent', isStudent);
        formData.append('isVolunteer', isVolunteer);
        formData.append('isProfessor', isProfessor);
        formData.append('susGarden', susGarden);
        formData.append('cali', cali);
        formData.append('argo', argo);
        formData.append('scale', scale);
        formData.append('time', time);

        fetch('http://localhost:5000/api/insert-survey', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({respondent, role, student, isStudent, isVolunteer, isProfessor, susGarden, cali, argo, scale, time})
        })
            .then(response => {
                if (response.ok) {
                    console.log('Data inserted successfully');
                } else {
                    console.error('Error inserting data');
                }
            })
            .catch(error => {
                console.error(error);
            });
    }

    return (
        <form onSubmit={handleSubmit}>
            <label>
                Respondent ID:
                <input type="text" value={respondent} onChange={event => setRespondent(event.target.value)} />
            </label>
            <label>
                Role ID:
                <input type="text" value={role} onChange={event => setRole(event.target.value)} />
            </label>
            <label>
                Student ID:
                <input type="text" value={student} onChange={event => setStudent(event.target.value)} />
            </label>
            <label>
                Is Student?:
                <input type="text" value={isStudent} onChange={event => setIsStudent(event.target.value)} />
            </label>
            <label>
                Is Volunteer?:
                <input type="text" value={isVolunteer} onChange={event => setIsVolunteer(event.target.value)} />
            </label>
            <label>
                Is Professor?:
                <input type="text" value={isProfessor} onChange={event => setIsProfessor(event.target.value)} />
            </label>
            <label>
                Is Sustainble Garden?:
                <input type="text" value={susGarden} onChange={event => setSusGarden(event.target.value)} />
            </label>
            <label>
                Is California Native Garden?:
                <input type="text" value={cali} onChange={event => setCali(event.target.value)} />
            </label>
            <label>
                Is Argohood?:
                <input type="text" value={argo} onChange={event => setArgo(event.target.value)} />
            </label>
            <label>
                Reducing Footprint Scale:
                <input type="text" value={scale} onChange={event => setScale(event.target.value)} />
            </label>
            <label>
                Timestamp:
                <input type="text" value={time} onChange={event => setTime(event.target.value)} />
            </label>
            
            <button type="submit">Submit</button>
        </form>
    );
}

function InsertForms() {
    const [formType, setFormType] = useState('Student');

    let form;
    if (formType === 'Student') {
        form = <Student />;
    } else if (formType === 'Course') {
        form = <Course />;
    } else if (formType === 'Instructor') {
        form = <Instructor />;
    } else if (formType === 'Enrollment') {
        form = <Enrollment />;
    } else if (formType === 'Roles') {
        form = <Roles />;
    } else if (formType === 'Demographics') {
        form = <Demographics />;
    } else if (formType === 'Survey') {
        form = <Survey />;
    } 





    function handleSelectChange(event) {
        setFormType(event.target.value);
    }

    return (
        <div>
            <select value={formType} onChange={handleSelectChange}>
                <option value="Student">Student</option>
                <option value="Course">Course</option>
                <option value="Instructor">Instructor</option>
                <option value="Enrollment">Enrollment</option>
                <option value="Roles">Roles</option>
                <option value="Demographics">Demographics</option>
                <option value="Survey">Survey</option>
            </select>
            {form}
        </div>
    );
}



export default InsertForms;