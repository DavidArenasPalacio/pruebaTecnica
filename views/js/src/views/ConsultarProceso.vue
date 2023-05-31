
<template>
    <div class="container mt-5">
        <div class="d-flex justify-content-between">
            <h1>Procesos/Eventos participación cerrada</h1>
            <button type="button" class="btn btn-dark" @click="volver">Volver</button>
        </div>
        <form @submit.prevent="filterProceso" class="mt-5">
            <div class="row mb-3">
                <div class="col-md-6 mb-3">
                    <label for="objetoDescripcion">ID cerrada</label>
                    <input type="text" class="form-control" v-model="idProceso" placeholder="Buscar por objeto">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="objetoDescripcion">Objeto / Descripción</label>
                    <input type="text" class="form-control" v-model="objetoDescripcion" placeholder="Buscar por objeto">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="estado">Estado</label>
                    <select v-model="estado" id="" class="form-select">
                        <option value="0">Todos</option>
                        <option value="1">Activo</option>
                        <option value="2">publicacado</option>
                        <option value="3">Evaluación</option>
                    </select>
                </div>

            </div>
            <div class="d-flex justify-content-end gap-2">
                <button class="btn btn-secondary" type="submit">Buscar</button>
                <button class="btn btn-success" type="button" @click="dowloadExcel">Generar excel</button>
            </div>
        </form>


        <table class="table mt-5">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Objeto</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Fecha Inicio</th>
                    <th scope="col">Fecha Fin</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(procesoEvento, index) in procesoEventos" :key="procesoEvento.id">
                    <th scope="row">{{ index + 1 }}</th>
                    <td>{{ procesoEvento.objeto }}</td>
                    <td>{{ procesoEvento.descripcion }}</td>
                    <td>{{ procesoEvento.fecha_inicio }}</td>
                    <td>{{ procesoEvento.fecha_cierre }}</td>
                    <td>{{ procesoEvento.estado === 1 ? 'Activo' : procesoEvento.estado === 2 ? 'Publicado' :
                        procesoEvento.estado === 3 ?
                            'Evaluación' : '' }}</td>
                    <td>
                        <button @click="peticionesProceso(procesoEvento.id)" class="btn btn-primary"> Ver o agregar
                            Peticiones</button>
                    </td>
                </tr>
            </tbody>

        </table>
        <div v-if="procesoEventos.length === 0">
            <p class="text-center">No se encontro datos</p>
        </div>
    </div>
</template>
<script scope>
import axios from 'axios';
import exportFromJSON from 'export-from-json'
export default {
    //Propiedades
    data() {
        return {
            procesoEventos: [],
            idProceso: '',
            objetoDescripcion: '',
            estado: '0'
        }
    },
    methods: {
        /**
        * Método para obtener todos los procesos 
        *
        */
        getAllProcesoEvento() {
            axios.get('http://localhost/pruebaTecnica/controllers/ProcesoEventoController.php')
                .then(response => {
                    //Almacenar los ressultados
                    this.procesoEventos = response.data;
                })
        },

        /**
        * Método para filtrar los procesos 
        *
        */
        filterProceso() {

            //Valida que cuando se busca y todos los campos estan vaciones, se vuelve a listar 
            if (this.idProceso.trim() === '' && this.objetoDescripcion.toLowerCase().trim() === '' && this.estado === '0') {
                this.getAllProcesoEvento();
            }
            // Filtrar los datos en función de los criterios seleccionados, devulve un  nuevo objeto
            this.procesoEventos = this.procesoEventos.filter(procesoEvento => {
                const idMatch = procesoEvento.id.toString().includes(this.idProceso.trim());
                const objetoMatch = procesoEvento.objeto.toLowerCase().includes(this.objetoDescripcion.toLowerCase().trim());
                const descripcionMatch = procesoEvento.descripcion.toLowerCase().includes(this.objetoDescripcion.toLowerCase().trim());
                const estadoMatch = this.estado === '0' || procesoEvento.estado === parseInt(this.estado);

                return idMatch && (objetoMatch || descripcionMatch) && estadoMatch;
            });


        },

        /**
        * Método para deescargar los datos en excel
        *
        */
        dowloadExcel() {

            //Itera cada elementos de procesoEventos cambiando el emcabezado y guardando el objeto en datos para luego exportarlo a excel 
            const datos = this.procesoEventos.map(procesoEvento => {
                return {
                    'ID oferta': procesoEvento.id,
                    'Objeto': procesoEvento.objeto,
                    'Actividad': procesoEvento.nombreSegmento,
                    'Descripción': procesoEvento.descripcion,
                    'Moneda': procesoEvento.moneda,
                    'Presupuesto': procesoEvento.presupuesto,
                    'Fecha de inicio': procesoEvento.fechaInicio,
                    'hora de inicio': procesoEvento.horaInicio,
                    'Fecha  cierre': procesoEvento.fecha_cierre,
                    'Estado': procesoEvento.estado === 1 ? 'Activo' : procesoEvento.estado === 2 ? 'Publicado' : procesoEvento.estado === 3 ?
                        'Evaluación' : ''
                }
            })
            const data = datos;
            const fileName = 'proceso';
            const exportType = exportFromJSON.types.xls;

            exportFromJSON({ data, fileName, exportType })
        },

        /**
        * meotodo para mostrar el componente CreateDocumentoPeticion.
        * Emite el evento "peticion-proceso" al componente padre.
        */
        peticionesProceso(id) {
            this.$emit('peticion-proceso', id);
        },
        /**
        * meotodo para volver al componente principal.
        * Emite el evento "volverPrincipal" al componente padre.
        */
        volver() {
            this.$emit('volverPrincipal');
        }
    },
    mounted() {
        this.getAllProcesoEvento();
    }
}
</script>