<script setup>
import FormCreateDocumentVue from "./FormCreateDocument.vue";
</script>
<template>
  <div class="mt-5 mr-auto">
    <div class="d-flex justify-content-between">
      <h1>Procesos/Eventos participación cerrada</h1>
      <button type="button" class="btn btn-dark" @click="volver">Volver</button>
    </div>
    <form @submit.prevent="createProceso">
      <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
          <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
            role="tab" aria-controls="nav-home" aria-selected="true">Información básica</button>
          <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button"
            role="tab" aria-controls="nav-profile" aria-selected="false">Cronograma</button>
          <button class="nav-link" id="nav-new-tab" data-bs-toggle="tab" data-bs-target="#nav-new" type="button"
            role="tab" aria-controls="nav-new" aria-selected="false">Documentación petición de ofertas </button>

        </div>
      </nav>
      <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active mt-5" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"
          tabindex="0">
          <div class="row">
            <div class="mb-3 col-6">
              <label for="objeto" class="form-label">Objeto</label>
              <input type="text" v-model="objeto" class="form-control" id="objeto" aria-describedby="objeto">
            </div>
            <div class="mb-3 col-6">
              <label for="actividades" class="form-label">Actividad </label>
              <v-select v-if="actividades" v-model="actividad" :options="actividades"
                :reduce="NombreFamilia => NombreFamilia.id" label="NombreFamilia" />

            </div>
            <div class="mb-3 col-6 ">
              <label for="descripcion" class="form-label">Descripción / Alcance</label>
              <textarea type="text" v-model="descripcion" class="form-control" id="descripcion"
                aria-describedby="descripcion"></textarea>
            </div>
          </div>
          <div class="row">
            <div class="mb-3 col-6 ">
              <label for="c" class="form-label">Moneda</label>
              <select v-model="moneda" class="form-select" id="">
                <option value="COP" selected>COP</option>
                <option value="USD">USD</option>
                <option value="EUR">EUR</option>
              </select>
            </div>
            <div class="mb-3 col-6 ">
              <label for="presupuesto" class="form-label">Presupuesto</label>
              <input type="number" v-model="presupuesto" class="form-control" id="presupuesto"
                aria-describedby="presupuesto">
            </div>
          </div>
        </div>
        <div class="tab-pane fade mt-5" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
          <div class="row">
            <div class="mb-3 col-3">
              <label for="fechaInicio" class="form-label">Fecha Inicio</label>
              <input type="date" v-model="fechaInicio" class="form-control" id="fechaInicio"
                aria-describedby="fechaInicio">
            </div>
            <div class="mb-3 col-3">
              <label for="horaInicio" class="form-label">Hora Inicio </label>
              <input type="time" v-model="horaInicio" class="form-control" id="horaInicio" aria-describedby="horaInicio">
            </div>
            <div class="mb-3 col-3 ">
              <label for="fechaCierre" class="form-label">Fecha de Cierre</label>
              <input type="date" v-model="fechaCierre" class="form-control" id="fechaCierre"
                aria-describedby="fechaCierre">
            </div>
            <div class="mb-3 col-3">
              <label for="horaCierra" class="form-label">Hora Cierre </label>
              <input type="time" v-model="horaCierra" class="form-control" id="horaCierra" aria-describedby="horaCierra">
            </div>
          </div>
          <button type="submit" class="btn btn-primary">Guardar</button>
        </div>
      </div>
    </form>
    <div class="tab-pane fade mt-5" id="nav-new" role="tabpanel" aria-labelledby="nav-new-tab" tabindex="0">
      <FormCreateDocumentVue :idProceso="idProceso" />
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {

  //Propiedades
  data() {
    return {
      actividades: [],
      idProceso: 0,
      objeto: '',
      actividad: '',
      descripcion: '',
      moneda: 'COP',
      presupuesto: '',
      fechaInicio: '',
      horaInicio: '',
      fechaCierre: '',
      horaCierra: '',
    };
  },
  methods: {

     /**
         * Método para obtener todos las actividades 
         *
         */
    getAllActividad() {
       // Realiza una petición GET al servidor
      axios.get("http://localhost/pruebaTecnica/controllers/ActividadController.php")
        .then((response) => {
          //Se itera los objetos de actividad recibidos y crear un nuevo objeto para cada actidad
          this.actividades = response.data.map((actividad) => ({
            id: actividad.id,
            NombreFamilia: actividad.NombreFamilia,
          }));
        })
        .catch((error) => {
          console.error("Error al obtener las actividades:", error);
        });
    },
    /**
        * Método para crear Proceso
        * Después de crear el Proceso,  se limpia el formulario 
        */
    createProceso() {
      //Se crear un objeto para almacenar los datos ingresados, luego se envia el objeto al servicor
      if(this.objeto === '' || this.actividad === '' || this.descripcion === '' || this.moneda === '' || this.presupuesto === '' || this.fechaInicio === '' ||this.fechaCierre === '' ||  this.horaCierra === ''){
        alert('Todos los campos son obligatorio');
        return;
      }
      const formProceso = {
        objeto: this.objeto,
        actividad: this.actividad,
        descripcion: this.descripcion,
        moneda: this.moneda,
        presupuesto: this.presupuesto,
        fechaInicio: this.fechaInicio,
        horaInicio: this.horaInicio,
        fechaCierre: this.fechaCierre,
        horaCierre: this.horaCierra
      }
      // Realizar la petición POST al servidor
      axios.post('http://localhost/pruebaTecnica/controllers/ProcesoEventoController.php', formProceso)
        .then(response => {
          //Se almacena el ID del registro que se acaba de hacer en en tabla proceso
          this.idProceso = response.data;
          this.objeto = '';
          this.actividad = '';
          this.descripcion = '';
          this.moneda = '';
          this.presupuesto = '';
          this.fechaInicio = '';
          this.horaInicio = '';
          this.fechaCierre = '';
          this.horaCierra = '';
          alert('Proceso creado exitosamente');
        })
        .catch((error) => {
          console.error("Error al guardar el proceso:", error);
        });
    },
    /**
        * metodo para volver al componenente principal
        * Emite el evento "volverPrincipal" al componente padre.
        */
    volver() {
      this.$emit('volverPrincipal');
    }

  },
  mounted() {
    this.getAllActividad();
  },
};
</script> documente este codigo