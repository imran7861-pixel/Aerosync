class CrudService {
    constructor(repository) {
        this.repository = repository;
    }

    async create(data) {
        try {
            const response = await this.repository.create(data);
            return response;
        } catch (error) {
           console.log("Something went wrong in crud service"); 
            throw error;
        }
    }

    async update(data, modelId) {
        try {
            const response = await this.repository.update(data, {
                where: {
                    id: modelId
                }
            });
            return response;
        } catch (error) {
           console.log("Something went wrong in crud service"); 
            throw error;
        }
    }

    async destroy(modelId) {
        try {
            await this.respository.destroy(modelId);
            return true;
        } catch (error) {
           console.log("Something went wrong in crud service"); 
            throw error;
        }
    }

    async get(modelId) {
        try {
            const response = await this.repository.get(modelId);
            return response;
        } catch (error) {
           console.log("Something went wrong in crud service"); 
            throw error;
        }
    }

    async getAll() {
        try {
            const response = await this.repository.getAll(data);
            return response;
        } catch (error) {
           console.log("Something went wrong in crud service"); 
            throw error;
        }
    }
}

module.exports = CrudService;