(function() {
  var $screen, animate, camera, define_ships, init_simulation, mesh, play_song, render, renderer, scene;

  $screen = $('#viewscreen');

  renderer = mesh = scene = camera = null;

  init_simulation = function() {
    var cobra_geom, fov, material, screenHeight, screenWidth;
    screenWidth = $screen.width();
    screenHeight = $screen.height();
    scene = new THREE.Scene();
    fov = 2 * Math.atan(screenHeight / (2 * 300));
    fov = fov * 180 / Math.PI;
    camera = new THREE.PerspectiveCamera(fov, screenWidth / screenHeight, 1, 5000);
    camera.position.z = 300;
    scene.add(camera);
    material = new THREE.MeshBasicMaterial({
      color: 0xff0000,
      wireframe: true
    });
    cobra_geom = define_ships();
    mesh = new THREE.Mesh(cobra_geom, material);
    scene.add(mesh);
    renderer = new THREE.CanvasRenderer();
    renderer.setSize(screenWidth, screenHeight);
    return $screen.append(renderer.domElement);
  };

  animate = function() {
    requestAnimationFrame(animate);
    return render();
  };

  render = function() {
    mesh.rotation.x += 0.01;
    mesh.rotation.y += 0.02;
    return renderer.render(scene, camera);
  };

  define_ships = function() {
    var cobra, f, facets, model, v, _i, _j, _len, _len2;
    cobra = new THREE.Geometry();
    model = [[0, 15, 10], [80, 5, -45], [25, -5, 45], [-25, -5, 45], [-80, 5, -45], [0, 15, -45], [95, -5, -25], [-95, -5, -25], [95, -5, -45], [-95, -5, -45], [-25, -15, -45], [25, -15, -45], [-60, -5, -45], [-60, 5, -45], [-75, 0, -45], [60, 5, -45], [75, 0, -45], [60, -5, -45], [-5, 5, -45], [-5, -10, -45], [-30, 0, -45], [-30, -5, -45], [5, 5, -45], [5, -10, -45], [30, 0, -45], [30, -5, -45], [0, 15, 10]];
    facets = [[0, 1, 2, 142, 0], [0, 3, 4, 142, 0], [0, 5, 1, 194, 0], [0, 4, 5, 194, 0], [2, 1, 6, 130, 0], [3, 7, 4, 130, 0], [1, 8, 6, 10, 0], [4, 7, 9, 10, 0], [2, 3, 0, 206, 0], [4, 9, 10, 46, 1], [1, 11, 8, 46, 0], [5, 4, 10, 46, 8], [5, 10, 11, 42, 7], [1, 5, 11, 46, 6], [12, 13, 14, 22, 5], [17, 16, 15, 22, 4], [20, 19, 18, 22, 3], [20, 21, 19, 22, 2], [22, 23, 24, 22, 1], [23, 25, 24, 22, 0], [2, 11, 10, 130, 1], [10, 3, 2, 130, 0], [8, 11, 2, 42, 0], [2, 6, 8, 42, 1], [3, 9, 7, 42, 0], [3, 10, 9, 42, 0]];
    for (_i = 0, _len = model.length; _i < _len; _i++) {
      v = model[_i];
      cobra.vertices.push(new THREE.Vertex(new THREE.Vector3(v[0], v[1], v[2])));
    }
    for (_j = 0, _len2 = facets.length; _j < _len2; _j++) {
      f = facets[_j];
      cobra.faces.push(new THREE.Face3(f[0], f[1], f[2]));
    }
    return cobra;
  };

  play_song = function() {
    return play('assets/elite-blue-danube.mid');
  };

  init_simulation();

  render();

  play_song();

  animate();

}).call(this);
