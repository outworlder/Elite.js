// https://github.com/mrdoob/three.js/wiki/API-Reference

var camera, scene, renderer,
geometry, material, mesh;

var $screen = $('#viewscreen');

init();
animate();

function init() {
    var screenWidth = $screen.width();
    var screenHeight = $screen.height();
    scene = new THREE.Scene();

    var fov = 2 * Math.atan( screenHeight / ( 2 * 300 ) );
    fov *= 180 / Math.PI;
    alert(fov);
    camera = new THREE.PerspectiveCamera( fov, screenWidth / screenHeight, 1, 5000 );
    camera.position.z = 300;
    scene.add( camera );

//    geometry = new THREE.CubeGeometry( 400, 400, 400 );
    material = new THREE.MeshBasicMaterial( { color: 0xff0000, wireframe: true } );

    var cobra_geom = define_ships();
  
    mesh = new THREE.Mesh( cobra_geom, material );
    scene.add( mesh );

    renderer = new THREE.CanvasRenderer();
    renderer.setSize( screenWidth, screenHeight );
    
    $screen.append( renderer.domElement );
}

function animate() {
    // note: three.js includes requestAnimationFrame shim
    requestAnimationFrame( animate );
    render();
}

function render() {

    mesh.rotation.x += 0.01;
    mesh.rotation.y += 0.02;

    renderer.render( scene, camera );
}

function define_ships() {
    // https://github.com/mrdoob/three.js/issues/255
    
    var cobra = new THREE.Geometry();
    var model = [ [0,15,10], [80,5,-45], [25,-5,45], [-25,-5,45], 
             [-80,5,-45], [0,15,-45], [95,-5,-25], [-95,-5,-25], 
             [95,-5,-45], [-95,-5,-45], [-25,-15,-45], [25,-15,-45], 
             [-60,-5,-45], [-60,5,-45], [-75,0,-45], [60,5,-45], 
             [75,0,-45], [60,-5,-45], [-5,5,-45], [-5,-10,-45], 
             [-30,0,-45], [-30,-5,-45], [5,5,-45], [5,-10,-45], 
             [30,0,-45], [30,-5,-45], [0,15,10] ];
    var facets = [ [0,1,2,142,0], [0,3,4,142,0], [0,5,1,194,0], [0,4,5,194,0], 
             [2,1,6,130,0], [3,7,4,130,0], [1,8,6,10,0], [4,7,9,10,0], 
             [2,3,0,206,0], [4,9,10,46,1], [1,11,8,46,0], [5,4,10,46,8], 
             [5,10,11,42,7], [1,5,11,46,6], [12,13,14,22,5], [17,16,15,22,4], 
             [20,19,18,22,3], [20,21,19,22,2], [22,23,24,22,1], [23,25,24,22,0], 
             [2,11,10,130,1], [10,3,2,130,0], [8,11,2,42,0], [2,6,8,42,1], 
             [3,9,7,42,0], [3,10,9,42,0] ];

    for (var i = 0; i < model.length; i++) {
	var v = model[i];
	var vertex = new THREE.Vertex(new THREE.Vector3(v[0], v[1], v[2]));
	cobra.vertices.push(vertex);
    };

    	// cobra.vertices.push(v1);
	// cobra.vertices.push(v2);
	// cobra.vertices.push(v3);

    for (var f = 0; f < facets.length; f++) {	
	var face = new THREE.Face3(facets[f][0], facets[f][1], facets[f][2]);

	cobra.faces.push(face);
    }

    return cobra;
}