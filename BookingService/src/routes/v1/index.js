const express = require('express');
const router = express.Router();

const { BookingController, HotelController, TaxiController } = require('../../controllers/index');

router.post('/booking', BookingController.create);
router.get('/booking/:id', BookingController.get);

router.post('/hotel', HotelController.create);
router.get('/hotel/:id', HotelController.get);

router.post('/taxi', TaxiController.create);
router.get('/taxi/:id', TaxiController.get);

module.exports = router;