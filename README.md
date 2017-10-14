# Will_paginate

Will paginate es una librería que nos permite realizar paginación a datos (especialmente a grandes cantidades) y poderlos manejar de mejor manera.

Para su instalación se necesita colocar la gema en el GemFile:
```ruby 
   gem 'will_paginate', '~> 3.1', '>= 3.1.6 
``` 
, y ejecutando el comando "bundle install". Además, se puede agregar la gema que maneja will_paginate para bootstrap: 
```ruby 
    gem 'will_paginate-bootstrap' 
```

### ¿Cómo usarla?
Se especifica en el controlador donde se realizará la paginación, los datos a los que se les quiere implementar “paginate”. Además, se puede especificar el número de datos por página.

```ruby
@students = Student.paginate(:page => params[:page], per_page: 10)
```

En seguida a esto, se debe modificar la vista (html) del controlador que estamos manejando. Lo más común sería la creación de una tabla.

```html 
<table>  
   <thead>
      ...Contenido del encabezado...
   </thead>
   <tbody>
      <% @students.each do |student| %>
         ...Contenido de cada registro...
   </tbody>
</table>

<div>
  <%= will_paginate @students, 
    renderer: BootstrapPagination::Rails,
    :class => "pagination", 
    :previous_label => "Atrás", 
    :next_label => "Adelante", 
    :inner_window => 1, 
    :outer_window => 1,
    :param_name => 'página'
  %>
</div>
```

Como se puede observar, en el ```html <tbody> ``` se realiza la iteración sobre cada uno de los registros guardados en el controlador. Además, al terminar la tabla se agrega los controles de paginación de la gema simplemente agregando: ```html <%= will_paginate @students %> ```, lo demás es personalización de estilos.

También, se pueden realizar muchos tipos de consultas para un mejor manejo de los datos:
* Ordenamiento:
```ruby
 @students = Student.paginate(:page => params[:page], per_page: 10).order('name ASC')
```
Esto ordenará todos los datos de clase 'Student' y los ordenará de forma ascendente por el nombre. Sin embargo, puede ir cualquier atributo de 'Student' y de igual manera, se puede ordenar de forma descendente (DESC).

* Selección:
```ruby
 @students = Student.paginate(:page => params[:page], per_page: 10).order('id ASC').select('id name lastname')
```
Aquí, ordenará de forma ascendente los id de todos los estudiantes y guardará solamente los atributos: id, nombre y apellido. ###### Se debe tener en cuenta que hay que modificar <table> en el html.

* Condiciones:
```ruby
 @students = Student.where(:career => 'Medicina').paginate(:page => params[:page], per_page: 10).order('id ASC').select('id name lastname')
```
Agregándole 'where', se puede realizar filtros en los datos. En este ejemplo, solo guardará los datos de estudiantes que están estudiando Medicina.

Así pues, will_paginate puede llegar a ser una gran herramienta para el manejo y visualización de gran cantidad de datos. Simplemente es 'jugar' con sus funcionalidades.
