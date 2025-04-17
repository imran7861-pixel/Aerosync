const { Op } = require('sequelize');
const { City } = require('../models/index');

class CityRepository {

    async createCity({ name }) {
        try {
            const city = await City.create({ 
                name
             });
             return city;
        } catch (error) {
            console.log("Something went wrong at repository layer create function");
            throw {error};
        }
    }

    // async bulkCreateCity(data) {
    //     try {
    //         const cities = await City.bulkCreate(data);
    //         return cities;
    //     } catch (error) {
    //         console.log("Something went wrong at repository layer create function");
    //         throw {error};
    //     }
    // }

    async deleteCity(cityId) {
        try {
            await City.destroy({
                where: {
                    id: cityId
                }
            });
            return true;
        } catch (error) {
            console.log("Something went wrong at repository layer delete function");
            throw {error};
        }
    }

    async updateCity(data, cityId) {
        try {
            const city = await City.findByPk(cityId);
            city.name = data.name;
            await city.save();
            return city;
        } catch (error) {
            console.log("Something went wrong at repository layer update function");
            throw {error};
        }
    }

    async getCity(cityId) {
        try {
            const city = await City.findByPk(cityId);
            return city;
        } catch (error) {
            
            console.log("Something went wrong at repository layer get function");
            throw {error};
        }
    }

    async getAllCities(filter) { // filter can be empty also
        try {
            if(filter.name) {
                const cities = await City.findAll({
                    where: {
                        name: {
                            [Op.startsWith]: filter.name
                    }
                }
                });
                return cities;
            }
            const cities = await City.findAll();
            return cities;
        } catch (error) {
            console.log("Something went wrong at repository layer getAll function");
            throw {error};
            
        }
    }

}


module.exports = CityRepository;