const { EventService } = require('../services/index');

const eventService = new EventService();

const create = async (req, res) => {
    try {
        const event = await eventService.create(req.body);
        return res.status(201).json({
            data: event,
            success: true,
            message: 'Successfully able to create an event',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Error occured while creating an event',
            err: {error}
        });
    }
}

const update = async (req, res) => {
    try {
        const event = await eventService.update(req.body.data, req.body.eventId);
        return res.status(201).json({
            data: event,
            success: true,
            message: 'Successfully able to update an event',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Error occured while updating an event',
            err: {error}
        });
    }
}

const destroy = async (req, res) => {
    try {
        const event = await eventService.delete(req.body.eventId);
        return res.status(201).json({
            data: event,
            success: true,
            message: 'Successfully able to delete an event',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Error occured while deleting an event',
            err: {error}
        });
    }
}

const get = async (req, res) => {
    try {
        const event = await eventService.get(req.body.eventId);
        console.log(event);
        return res.status(201).json({
            data: event,
            success: true,
            message: 'Successfully able to fetch an event',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Error occured while fetching an event',
            err: {error}
        });
    }
}

const getAll = async (req, res) => {
    try {
        const event = await eventService.getAll();
        return res.status(201).json({
            data: event,
            success: true,
            message: 'Successfully able to fetch an event',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Error occured while fetching events',
            err: {error}
        });
    }
}

const getByCityId = async (req, res) => {
    try {
        const event = await eventService.getByCityId(req.body.idOfCity);
        return res.status(201).json({
            data: event,
            success: true,
            message: 'Successfully able to fetch an event',
            err: {}
        });
    } catch (error) {
        return res.status(500).json({
            data: {},
            success: false,
            message: 'Error occured while fetching events',
            err: {error}
        });
    }
}

module.exports = {
    create,
    update,
    destroy,
    get,
    getAll,
    getByCityId
}