const { EventRepository } = require('../repository/index');

class EventService {
    constructor() {
        this.eventRepository = new EventRepository();
    }
    async create(data) {
        try {
            const event = await this.eventRepository.create(data);
            return event;
        } catch (error) {
            console.log("Something went wrong at repository layer create function");
            throw { error };
        }
    }

    async update(data, eventId) {
        try {
            const event = await this.eventRepository.update(data, eventId);
            return event;
        } catch (error) {
            console.log("Something went wrong at repository layer update function");
            throw { error };
        }
    }

    async delete(eventId) {
        try {
            const response = await this.eventRepository.delete(eventId);
            return response;
        } catch (error) {
            console.log("Something went wrong at repository layer create function");
            throw { error };
        }
    }

    async get(eventId) {
        try {
            const event = await this.eventRepository.get(eventId);
            return event;
        } catch (error) {
            console.log("Something went wrong at repository layer get function");
            throw { error };
        }
    }

    async getAll() {
        try {
            const event = await this.eventRepository.getAll();
            return event;
        } catch (error) {
            console.log("Something went wrong at repository layer create function");
            throw { error };
        }
    }

    async getByCityId(idOfCity) {
        try {
            const event = await this.eventRepository.getByCityId(idOfCity);
            return event;
        } catch (error) {
            console.log("Something went wrong at repository layer create function");
            throw { error };
        }
    }


}

module.exports = EventService;