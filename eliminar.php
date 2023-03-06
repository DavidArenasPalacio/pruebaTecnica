<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar</title>

</head>

<body>

    <?php
    include_once('conexion.php');
    include_once('cabecera.php');

    echo '<pre>';
    $sql = "SELECT id,nombre,apellido, documento, direccion FROM usuarios";
    $resultado = $conexion->query($sql);


    ?>

    <div class="container">
        <?php if ($resultado->num_rows > 0) : ?>
            <table class="table table-striped" id="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Documento</th>
                        <th scope="col">Dirección</th>
                        <th scope="col" class="text-center">Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($resultado as $usuario) : ?>

                        <tr>
                            <th scope="row"><?= $usuario["id"] ?></th>
                            <td><?= $usuario["nombre"] ?></td>
                            <td><?= $usuario["apelllido"] ?></td>
                            <td><?= $usuario["documento"] ?></td>
                            <td><?= $usuario["direccion"] ?></td>
                            <td>
                            <a href="eliminarR.php?id=<?=$usuario['id'];?>" class="btn btn-danger">Eliminar</a>

<!--   <form action="eliminarR.php" method="POST">
      <input type="hidden" name="id" value="<?=$usuario['id']?>">
      <button type="submit" class="btn btn-danger">Eliminar</button>
  </form> -->
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>

        <?php else : ?>
            <?= "Sin registros encontrados en la base de datos"; ?>
        <?php endif; ?>

    </div>



    </pre>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
    <script>
        let table = $('#table').DataTable({
            language: {
                "decimal": "",
                "emptyTable": "No hay información",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ Entradas",
                "loadingRecords": "Cargando...",
                "processing": "Procesando...",
                "search": "Buscar:",
                "zeroRecords": "Sin resultados encontrados",
                "paginate": {
                    "first": "Primero",
                    "last": "Ultimo",
                    "next": "Siguiente",
                    "previous": "Anterior"
                }
            }
        });
    </script>

</body>

</html>
