const { Pool } = require('pg');

//establish connection with local DB
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// get query parameters  and pass them to query
const cohortName = process.argv[2] || 'JUL02';

const values = [`${cohortName}`];


const selectTeachers = `SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
                        FROM teachers
                        JOIN assistance_requests ON teacher_id = teachers.id
                        JOIN students ON student_id = students.id
                        JOIN cohorts ON cohort_id = cohorts.id
                        WHERE cohorts.name = $1
                        ORDER BY teachers.name;`

                  
pool.query(selectTeachers, values)
  .then(res => {
    res.rows.forEach(t => {
      console.log(`${t.cohort} : ${t.teacher}`);
    })
  })
  .catch(err => {
    console.error('query error', err.stack)    
  });
