'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Event extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Event.init({
    cityId: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    eventName: {
      type: DataTypes.STRING,
      allowNull: false
    },
    eventSubtitle: {
      type: DataTypes.STRING,
      allowNull: false
    },
    description: {
      type: DataTypes.STRING,
      allowNull: false
    },
    actualPrice: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    discountPrice: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
  }, {
    sequelize,
    modelName: 'Event',
  });
  return Event;
};