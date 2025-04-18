const { StatusCodes } = require('http-status-codes');
const AppError = require('./error-handler');

class ValidationError extends AppError {
    constructor(error) {
        let errorName = error.name;
        let explanation = [];
        error.errors.forEach(err => {
            explanation.push(err.message);
        });
        super(
            errorName,
            'Not able to validate the data sent in the request',
            explanation,
            StatusCodes.INTERNAL_SERVER_ERROR
        );
    }
}

module.exports = ValidationError;
