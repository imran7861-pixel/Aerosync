const { Airplane } = require('../models/index');

class AirplaneRepository {
    async getAirplane(id) {
        try {
            const airplane = await Airplane.findByPk(id)
            return airplane;
        } catch (error) {
            console.log("Something went wrong at repository layer");
            throw {error};
        }
    }

    async create(data) {
        try {
            const airplane = await Airplane.create(data)
            return airplane;
        } catch (error) {
            console.log("Something went wrong at repository layer");
            throw {error};
        }
    }

    async getAllAirplane() {
        try {
            const airplane = await Airplane.findAll();
            return airplane;
        } catch (error) {
            console.log("Something went wrong at repository layer");
            throw {error};
        }
    }
}

module.exports = AirplaneRepository;