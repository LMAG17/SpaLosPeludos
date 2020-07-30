const express = require('express');
const router = express.Router();
const Instagram=require('node-instagram')
router.get('/', (req, res) => {
    res.render('index')
});


// router.get('/login', )

module.exports = router