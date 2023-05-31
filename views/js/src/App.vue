<script setup>
import HelloWorld from './components/HelloWorld.vue'
import TheWelcome from './components/TheWelcome.vue'
import { RouterLink, RouterView } from 'vue-router'
import HomeView from './views/HomeView.vue'
import CreateProceso from './views/CreateProceso.vue'
import ConsultarProceso from './views/ConsultarProceso.vue'
import CreateDocumentoPeticion from './views/CreateDocumentoPeticion.vue'
</script>

<template>
  <div class="container">

    <!-- Menú -->
    <!-- Componente menu  se muestra cuando los demas componentes estan deshabilitados -->
    <nav v-if="!mostrarCreateProceso && !mostrarConsultarProceso && !mostrarDocumentoPeticion">
      <!-- Comoponente inicial que muestra los botones "crear" y "consultar"  -->
      <HomeView @mostrar-create-proceso="mostrarCreateProcesoHandler"
        @mostrar-consultar-proceso="mostrarConsultarProcesoHandler" />
    </nav>
    <!-- Comoponente para crear el proceso -->
    <CreateProceso v-if="mostrarCreateProceso" @volverPrincipal="volver" />
    <!-- Comoponente para consultar proceso -->
    <ConsultarProceso v-if="mostrarConsultarProceso" @peticion-proceso="verPeticion" @volverPrincipal="volver" />
    <!-- Comoponente para crear Documentos -->
    <CreateDocumentoPeticion :idProceso="idProceso" @volverPrincipal="volver" v-if="mostrarDocumentoPeticion" />
  </div>
</template>

<script>
export default {

  //Propiedades
  data() {
    return {
      mostrarCreateProceso: false,
      mostrarConsultarProceso: false,
      mostrarDocumentoPeticion: false,
      idProceso: 0
    };
  },
  methods: {
    /**
    *  meotodo para  CreateProceso.
    * Deshabilita los otros componentes y muestra CreateProceso.
    */
    mostrarCreateProcesoHandler() {
      this.mostrarConsultarProceso = false;
      this.mostrarDocumentoPeticion = false;
      this.mostrarCreateProceso = true;
    },
     /**
     * meotodo para ConsultarProceso.
     * Deshabilita los otros componentes y muestra ConsultarProceso.
     */
    mostrarConsultarProcesoHandler() {
      this.mostrarCreateProceso = false;
      this.mostrarDocumentoPeticion = false;
      this.mostrarConsultarProceso = true;
    },

    /**
     * meotodo para ConsultarProceso CreateDocumentoPeticion y pasa el id del proceso seleccionado.
     * Deshabilita los otros componentes.
     * 
     *  idProceso - El id del proceso seleccionado.
     */

    verPeticion(idProceso) {
      this.mostrarConsultarProceso = false;
      this.mostrarCreateProceso = false;
      this.mostrarDocumentoPeticion = true;
      this.idProceso = idProceso;
    },

     /**
     * Vuelve a la vista principal, deshabilitando todos los componentes.
     */

    volver() {
      this.mostrarConsultarProceso = false;
      this.mostrarDocumentoPeticion = false;
      this.mostrarCreateProceso = false;
    }
  }
};

</script>
