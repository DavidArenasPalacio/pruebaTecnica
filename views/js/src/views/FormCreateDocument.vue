
<template>
    <table class="table " v-if="mostrarListado">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Titulo</th>
                <th scope="col">Contenido</th>
                <th scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(documentProceso, index) in documentProcesos" :key="documentProceso.id">
                <th scope="row">{{ index+1 }}</th>
                <td>{{ documentProceso.titulo }}</td>
                <td>{{ documentProceso.descripcion }}</td>
                <td>
                    <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"
                        @click="mostrarDocumentos(documentProceso.id)">Ver documentos</button>

                    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
                        aria-labelledby="offcanvasRightLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasRightLabel">Documentos</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <li v-for="documento in documentos" :key="documento.id">
                                <a :href="'../../../' + documento.filepath" target="_blank" rel="noopener noreferrer">Ver
                                    Documento</a>
                            </li>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <form @submit.prevent="createDocumentosEvent" v-if="mostrarFormularioCreate && !mostrarListado">
        <div class="mb-3">
            <label for="titulo" class="form-label">Titulo</label>
            <input type="text" class="form-control" id="titulo" v-model="titulo" aria-describedby="titulo">
        </div>
        <div class="mb-3">
            <label for="descripcion" class="form-label">Descripción</label>
            <textarea class="form-control" v-model="descripcion" id="descripcion"></textarea>
        </div>
        <div class="mb-3">
            <label for="documentos" class="form-label">Documentos</label>
            <input class="form-control" type="file" multiple ref="uploadfiles" id="documentos">
        </div>
        <div class="d-flex justify-content-end">
            <button type="submit" class="btn btn-primary">Guardar</button>
        </div>
    </form>
    <button class="btn btn-secondary" @click="mostrarFormulario" v-if="mostrarListado">Agregar
        contenido</button>
    <button class="btn btn-secondary" @click="mostrarList" v-if="!mostrarListado">Mostrar Listado</button>
</template>


<script scop>
import axios from 'axios';

export default {
    props: {
        idProceso: {
            type: Number,
            required: true
        }
    },

    //Propiedades
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
        * Método para crear documentos asociados a un proceso
        * Después de crear los documentos, se limpia el formulario y se obtienen nuevamente los documentos asociados al proceso
        */
        createDocumentosEvent() {
            // Crear un objeto FormData para enviar los datos y los archivos al servidor
            if (this.titulo === '' || this.$refs.uploadfiles.files.length === 0) {
                alert('El campo titulo y documento es obligatorio');
                return;
            }
            if (parseInt(this.idProceso) === 0 ) {
                alert('Cree un nuevo proceso');
                return;
            }
            const formData = new FormData();
            let files = this.$refs.uploadfiles.files;
            formData.append('proceso_id', this.idProceso);
            formData.append('titulo', this.titulo);
            formData.append('descripcion', this.descripcion);
            for (let i = 0; i < files.length; i++) {
                formData.append('documentos[]', files[i]);
            }
            // Realizar la petición POST al servidor
            axios.post('http://localhost/pruebaTecnica/controllers/DocumentacionOfertaController.php', formData, {
                headers: {
                    "Content-Type": "multipart/form-data"
                }
            })
                .then(response => {
                    // Limpiar el formulario
                    this.titulo = '';
                    this.descripcion = '';
                    alert('Documentos almacenados correctamente');
                    this.mostrarFormularioCreate = false;
                    this.mostrarListado = true;
                    // Obtener nuevamente los documentos asociados al proceso
                    this.getAllDocumentProcesoId();
                })
                .catch((error) => {
                    console.error("Error al obtener las actividades:", error);
                })
        },

        /**
       * Método para obtener todos los documentos asociados a un proceso mediante su ID
       *
       */
        getAllDocumentProcesoId() {
            // Realiza una petición GET al servidor
            axios.get(`http://localhost/pruebaTecnica/controllers/DocumentacionOfertaController.php?id=${this.idProceso}`)
                .then(response => {
                    this.documentProcesos = response.data;
                })
                .catch((error) => {
                    console.error("Error al obtener las actividades:", error);
                })
        },


        /**
         * Método para mostrar los documentos asociados a un documentocionOferta
         *  ID del documentocionOferta
         */
        mostrarDocumentos(id) {
            console.log(id)
            // Realiza una petición GET al servidor
            axios.get(`http://localhost/pruebaTecnica/controllers/DocumentacionOfertaController.php?idDocumento=${id}`)
                .then(response => {
                    //Se almacena los datos
                    this.documentos = response.data;
                }).catch((error) => {
                    console.error("Error al obtener las actividades:", error);
                })

        },
        /**
         * Método para mostrar el formulario 
         */
        mostrarFormulario() {
            this.mostrarListado = false;
            this.mostrarFormularioCreate = true;
        },
        /**
        * Método para mostrar la lista 
        */
        mostrarList() {
            this.mostrarFormularioCreate = false;
            this.mostrarListado = true;
        },
    },
    mounted() {
        // Obtener los documentosOferta asociados al proceso 
        this.getAllDocumentProcesoId();
    }
}
</script> 