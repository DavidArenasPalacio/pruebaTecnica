
<template>
    <div class=" mt-5 mr-auto card bg-blue">
        <div class="card-body">
            <h2 class="text-white">Procesos/Eventos</h2>
        </div>

        <div class="card-footer bg-blue-opacity ">
            <div class="d-flex justify-content-evenly w-50 m-auto">
                <button class="btn btn-outline-secondary text-white mr-10" @click="mostrarCreateProceso">Crear</button>
                <button class="btn btn-outline-secondary text-white" @click="mostrarConsultarProceso">Consultar</button>
            </div>
        </div>

    </div>
</template>

<style scoped>
.bg-blue {
    background-color: rgb(26, 26, 125);
}

.bg-blue-opacity {
    background-color: rgb(26, 26, 100);
}
</style>    

<script scope>
export default {
    methods: {
        /**
        *   meotodo para mostrar el componente CreateProceso.
        * Emite el evento "mostrar-create-proceso" al componente padre.
        */

        mostrarCreateProceso() {
            this.$emit('mostrar-create-proceso');
        },

        /**
         * meotodo para mostrar el componente CreateProceso.
         * Emite el evento "mostrar-consultar-proceso" al componente padre.
         */

        mostrarConsultarProceso() {
            this.$emit('mostrar-consultar-proceso');
        }
    }
};
</script>