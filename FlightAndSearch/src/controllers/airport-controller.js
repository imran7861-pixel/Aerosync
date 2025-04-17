const { AirportService } = require('../services/index');

const airportService = new AirportService();

const create = async (req, res) => {
    try {
        const airport = await airportService.create(req.body);
        return res.status(201).json({
            data: airport,
            success: true,
            message: 'Successfully able to create an airport',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Error occured while creating an airport',
            err: {error}
        });
    }
}

const get = async (req, res) => {
    try {
        const airport = await airportService.get(req.body);
        return res.status(201).json({
            data: airport,
            success: true,
            message: 'Successfully able to fetch an airport',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Error occured while fetch an airport',
            err: {error}
        });
    }
}

const getAll = async (req, res) => {
    try {
        const airport = await airportService.getAll();
        return res.status(201).json({
            data: airport,
            success: true,
            message: 'Successfully able to create an airport',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Error occured while creating an airport',
            err: {error}
        });
    }
}

module.exports = {
    create,
    get,
    getAll
}