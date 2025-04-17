const { response } = require('express');
const { FlightService } = require('../services/index');

const flightService = new FlightService();
const create = async (req, res) => {
    try {
        const flightRequestData = {
            flightNumber: req.body.flightNumber,
            airplaneId: req.body.airplaneId,
            cityId: req.body.cityId,
            departureAirportId: req.body.departureAirportId,
            arrivalAirportId: req.body.arrivalAirportId,
            arrivalCityName: req.body.arrivalCityName,
            departureCityName: req.body.departureCityName,
            arrivalAirportName: req.body.arrivalAirportName,
            departureAirportName: req.body.departureAirportName,
            arrivalTime: req.body.arrivalTime,
            departureTime: req.body.departureTime,
            price: req.body.price
        }
        const flight = await flightService.createFlight(flightRequestData);
        return res.status(200).json({
            data: flight,
            success: true,
            message: 'Successfully created a flight',
            err: {}
        })
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Error occured while creating a flight',
            err: {error}
        })
    }
}

const getAll = async (req, res) => {
    try {
        const response = await flightService.getAllFlights(req.query);
        return res.status(200).json({
            data: response,
            success: true,
            message: 'Successfully fetched all flight',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Not able to fetch the flights',
            err: {error}
        });
    }
}

const get = async (req, res) => {
    try {
        const response = await flightService.getFlight(req.params.id);
        return res.status(200).json({
            data: response,
            success: true,
            message: 'Successfully fetched the flights',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Not able to fetch the flight',
            err: {error}
        });
    }
}

const update = async (req, res) => {
    try {
        const response = await flightService.updateFlight(req.params.id, req.body);
        return res.status(200).json({
            data: response,
            success: true,
            message: 'Successfully updated the flight',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Not able to update the flight',
            err: {error}
        });
    }
}

const getByCityId = async (req, res) => {
    try {
        const response = await flightService.getByCityId(req.query);
        return res.status(200).json({
            data: response,
            success: true,
            message: 'Successfully fetched the flights',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Not able to fetch the flight',
            err: {error}
        });
    }
}

module.exports = {
    create,
    getAll,
    get,
    update,
    getByCityId
};