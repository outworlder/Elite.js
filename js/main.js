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

    camera = new THREE.PerspectiveCamera( 75, screenWidth / screenHeight, 1, 10000 );
    camera.position.z = 1000;
    scene.add( camera );

    geometry = new THREE.CubeGeometry( 400, 400, 400 );
    material = new THREE.MeshBasicMaterial( { color: 0xff0000, wireframe: true } );

    mesh = new THREE.Mesh( geometry, material );
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
