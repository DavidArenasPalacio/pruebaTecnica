<script setup>
import FormCreateDocument from './FormCreateDocument.vue';
</script>
<template>
    <div class="container mt-5">
        <div class="d-flex justify-content-between">
            <h1>Procesos/Eventos participación cerrada</h1>
            <button type="button" class="btn btn-dark" @click="volver">Volver</button>
        </div>
        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home"
                    type="button" role="tab" aria-controls="nav-home" aria-selected="true">Información</button>
                <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile"
                    type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Documentación petición de
                    ofertas</button>
            </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"
                tabindex="0">
                <li v-for="proceso in procesoEventos" :key="proceso.id">
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="exampleFormControlInput1" class="form-label">Actividad</label>
                            <input type="text" class="form-control" :value="proceso.nombreSegmento"
                                id="exampleFormControlInput1" disabled>
                        </div>
                        <div class="mb-3 col-6">
                            <label for="exampleFormControlInput1" class="form-label">Objeto</label>
                            <input type="text" class="form-control" disabled :value="proceso.objeto"
                                id="exampleFormControlInput1">
                        </div>
                        <div class="mb-3 col-12">
                            <label for="exampleFormControlTextarea1" class="form-label">Descripción</label>
                            <textarea class="form-control" disabled id="exampleFormControlTextarea1"
                                rows="3">{{ proceso.descripcion }}</textarea>
                        </div>
                        <div class="mb-3 col-6">
                            <label for="exampleFormControlTextarea1" class="form-label">Moneda</label>
                            <input type="text" class="form-control" :value="proceso.moneda" id="exampleFormControlInput1"
                                disabled>
                        </div>
                        <div class="mb-3 col-6">
                            <label for="exampleFormControlTextarea1" class="form-label">Presupuesto</label>
                            <input type="number" class="form-control" :value="proceso.presupuesto"
                                id="exampleFormControlInput1" disabled>
                        </div>
                        <div class="mb-3 col-6">
                            <label for="exampleFormControlTextarea1" class="form-label">Fecha de inicio</label>
                            <input type="date" class="form-control" :value="proceso.fechaInicio"
                                id="exampleFormControlInput1" disabled>
                        </div>
                        <div class="mb-3 col-6">
                            <label for="exampleFormControlTextarea1" class="form-label">Hora inicio</label>
                            <input type="time" class="form-control" :value="proceso.horaInicio"
                                id="exampleFormControlInput1" disabled>
                        </div>
                        <div class="mb-3 col-6">
                            <label for="exampleFormControlTextarea1" class="form-label">Fecha de cierre</label>
                            <input type="date" class="form-control" :value="proceso.fechaCierre"
                                id="exampleFormControlInput1" disabled>
                        </div>
                        <div class="mb-3 col-6">
                            <label for="exampleFormControlTextarea1" class="form-label">Hora Cierre</label>
                            <input type="time" class="form-control" :value="proceso.horaCierre"
                                id="exampleFormControlInput1" disabled>
                        </div>
                        <div class="mb-3 col-6">
                            <label for="exampleFormControlTextarea1" class="form-label">Estado</label>
                            <input type="text" class="form-control" :value="proceso.estado === 1 ? 'Activo' : proceso.estado === 2 ? 'Publicado' : proceso.estado === 3 ?
                                'Evaluación' : ''" id="exampleFormControlInput1" disabled>
                        </div>
                    </div>
                </li>
            </div>
            <div class="tab-pane fade mt-5" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
                <FormCreateDocument :idProceso="idProceso" />
            </div>
        </div>
    </div>
</template>


<script scope>
import axios from 'axios';
export default {
    props: {
        idProceso: {
            type: Number,
            required: true
        }
    },
    data() {
        return {
            procesoEventos: [],
            documentProcesos: [],
            mostrarListado: true,
            mostrarFormularioCreate: false,
            titulo: '',
            descripcion: '',
            documentos: []
        }
    },
    methods: {
        /**
     * Método para obtener el proceso po el  ID
     *
     */
        getAllProcesoEventoId() {
            // Realiza una petición GET al servidor
            axios.get(`http://localhost/pruebaTecnica/controllers/ProcesoEventoController.php?id=${this.idProceso}`)
                .then(response => {
                    this.procesoEventos = response.data;
                })
                .catch((error) => {
                    console.error("Error al obtener las actividades:", error);
                })
        },
        volver() {
            this.$emit('volverPrincipal');
        }


    },
    /**
       * metodo para volver al componenente principal
       * Emite el evento "volverPrincipal" al componente padre.
       */
    mounted() {
        this.getAllProcesoEventoId();
    }

}
</script>