const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const ApiRoutes = require('./routes/index');
const { PORT, DB_SYNC } = require('./config/serverConfig');
const db = require('./models/index')
const { Hotel } = require('./models/index');

const setUpAndStartServer = async () => {
    
    const corsOptions = {
        origin: '*',
        optionsSuccessStatus: 200,// some legacy browsers (IE11, various SmartTVs) choke on 204
        methods: ['GET','POST','PUT','DELETE'],
        allowedHeaders: ['Content-Type', 'Access-Control-Allow-Headers']
      }

    const app = express();

    app.use(bodyParser.json());
    app.use(bodyParser.urlencoded({extended: true}));

    app.use(cors(corsOptions));

    app.use('/api', ApiRoutes);

    app.listen(PORT, async () => {
        console.log(`Server started at PORT:${PORT}`);

        if( DB_SYNC ){
            // db.sequelize.sync({alter: true}); // Before synchronzation these functions like get,add donot work
        }

    //    const response =  await Hotel.findAll({ where: { cityId: 6}});
    //     console.log(response);
    });
}

setUpAndStartServer();