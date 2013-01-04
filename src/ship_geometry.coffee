class ShipGeometry extends THREE.Geometry
  constructor: ->

  loadGeometry: (vertexes, faces) ->
    this.vertices.push(new THREE.Vertex(new THREE.Vector3(v[0],v[1],v[2]))) for v in vertexes
    this.faces.push(new THREE.Face3(f[0], f[1], f[2])) for f in faces

(exports ? this).ShipGeometry = ShipGeometry