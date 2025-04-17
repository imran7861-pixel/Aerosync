const { Event } = require('../models/index');

class EventRepository {
    async create(data) {
        try {
            const event = await Event.create(data);
            return event;
        } catch (error) {
            console.log("Something went wrong at repository layer create function");
            throw { error };
        }
    }

    async update(data, eventId) {
        try {
            const event = await Event.findByPk(eventId);
            event.eventName = data.name;
            await event.save();
            return event;
        } catch (error) {
            console.log("Something went wrong at repository layer update function");
            throw { error };
        }
    }

    async delete(eventId) {
        try {
            await Event.destroy({
                where: {
                    id: eventId
                }
            });
            return true;
        } catch (error) {
            console.log("Something went wrong at repository layer create function");
            throw { error };
        }
    }

    async get(eventId) {
        try {
            const event = await Event.findByPk(eventId);
            console.log(event);
            return event;
        } catch (error) {
            console.log("Something went wrong at repository layer get function");
            throw { error };
        }
    }

    async getAll() {
        try {
            const event = await Event.findAll();
            return event;
        } catch (error) {
            console.log("Something went wrong at repository layer create function");
            throw { error };
        }
    }

    async getByCityId(idOfEvent) {
        try {
            const event = await Event.findAll({ where: { cityId: idOfEvent}});
            console.log(event);
            return event;
        } catch (error) {
            console.log(error);
            console.log("Something went wrong at repository layer getByCityId function");
            throw { error };
        }
    }


}

module.exports = EventRepository;