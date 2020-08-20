const { Pool } = require('pg');

//establish connection with local DB
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// get query parameters  and pass them to query
const cohortName = process.argv[2];
const limit = process.argv[3] || 5;

const values = [`%${cohortName}%`, limit]

const selectId = `SELECT students.id as student_id, students.name as name, cohorts.name as cohort
                  FROM students
                  JOIN cohorts ON cohorts.id = cohort_id
                  WHERE cohorts.name LIKE $1
                  LIMIT $2;`;
                  
pool.query(selectId, values)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an ID : ${user.student_id} & was in the cohort :${user.cohort}`);
    })
  })
  .catch(err => {
    console.error('query error', err.stack)    
  });