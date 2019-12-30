<div class="container-fluid section-dark-flow buffer">
  <div class="container">
    <div class="row">
      <div class="col-md-5 col-md-offset-1">
        <h2>What does Aurora do?</h2>
        <p>
        Aurora runs applications and services across a shared pool of machines,
        and is responsible for keeping them running, forever. When machines experience
        failure, Aurora intelligently reschedules those jobs onto healthy machines.
        </p>
      </div>
      <div class="col-md-4 col-md-offset-1">
        <iframe width="420" height="236" src="https://www.youtube.com/embed/asd_h6VzaJc" frameborder="0" allowfullscreen></iframe>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid buffer">
  <div class="container">
  <h2 class="text-center">Key Aurora Features</h2>
  <div class="row">
    <div class="col-md-2 text-center"><p><span class="glyphicon glyphicon-tasks"></span></p></div>
    <div class="col-md-4"><h3>Rolling Updates with Automatic Rollback</h3><p>When updating a job, Aurora will detect the health and status of a deployment and automatically rollback if necessary.</p></div>
    <div class="col-md-2 text-center"><p><span class="glyphicon glyphicon-th"></span></p></div>
    <div class="col-md-4"><h3>Resource Quota and Multi-User Support</h3><p>Aurora has a quota system to provide guaranteed resources for specific applications, and can support multiple users to deploy services.</p></div>
  </div>
  <div class="row">
    <div class="col-md-2 text-center"><p><span class="glyphicon glyphicon-list-alt"></span></p></div>
    <div class="col-md-4"><h3>Sophisticated DSL</h3><p>Services are highly-configurable via a <a href="/documentation/latest/reference/configuration-tutorial/">DSL</a> which supports templating, allowing you to establish common patterns and avoid redundant configurations.</p></div>
    <div class="col-md-2 text-center"><p><span class="glyphicon glyphicon-cloud-upload"></span></p></div>
    <div class="col-md-4"><h3>Service Registration</h3><p>Aurora <a href="/documentation/latest/features/service-discovery/">announces</a> services to Apache ZooKeeper for discovery by clients like Finagle.</p></div>
  </div>
 </div>
</div>
