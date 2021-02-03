<!-- <div class="modal fade text-center" id="LAMPModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="LAMPModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-primary" id="LAMPModalLongTitle">LAMP
					- Stack Summery</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<br>

				<p class="text-primary">
					<b> Target Environment Details</b>
				</p>
				<table class="table table-bordered border-primary"
					style="margin-top: 2%; margin-bottom: 2%;">
					<thead>
						<tr class="thead-light">
							<th scope="col">Organization</th>
							<th scope="col">Project</th>
							<th scope="col">Region</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">No Organisation</th>
							<td>cloudglobaldelivery-1000135575</td>
							<td>us-central1</td>
						</tr>

					</tbody>
				</table>


				<p class="text-primary">
					<b> LAMP Stack Details</b>
				</p>
				<table class="table table-bordered border-primary"
					style="margin-top: 2%; margin-bottom: 2%;">
					<thead>
						<tr class="thead-light">
							<th scope="col">Stack</th>
							<th scope="col">Description</th>
							<th scope="col">VMs</th>
							<th scope="col">Machine type</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">Linux</th>
							<td>Operating System</td>
							<td rowspan="4">1</td>
							<td rowspan="4">n1-standard-1</td>
						</tr>
						<tr>
							<th scope="row">Apache</th>
							<td>Web Server</td>
						</tr>
						<tr>
							<th scope="row">Perl, PHP or Python</th>
							<td>Scripting languages</td>
						</tr>
						<tr>
							<th scope="row">MySQL</th>
							<td>Database Server</td>
							
						</tr>
						<tr class="thead-light">
							<th scope="row" colspan="2">Total VMs</th>
							<th colspan="2">1</th>
						</tr>

					</tbody>
				</table>

				Estimated costs: <span class="text-danger"><b>
						$13.61/month</b></span>
			</div>
			<div class="modal-footer">
				<form id="myForm" action="trigger" method="post">
					<input type="hidden" name="stack" id="stack" value="LAMP" />
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Launch</button>
				</form>
			</div>
		</div>
	</div>
</div>
 -->



<div class="modal fade text-center" id="LAMPModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="LAMPModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form id="myForm" action="trigger" method="post">
				<div class="modal-header">
					<h5 class="modal-title text-primary" id="LAMPModalLongTitle">LAMP
						- Stack Summery</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<br>

					<p class="text-primary">
						<b> Target Environment Details</b>
					</p>
					<table class="table table-bordered border-primary"
						style="margin-top: 2%; margin-bottom: 2%;">
						<thead>
							<tr class="thead-light">
								<th scope="col">Organization</th>
								<th scope="col">Project</th>
								<th scope="col">Region</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">No Organisation</th>
								<td>cloudglobaldelivery-1000135575</td>
								<td>us-east1</td>
							</tr>

						</tbody>
					</table>


					<p class="text-primary">
						<b> LAMP Stack Details</b>
					</p>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Stack
								Name</span>
						</div>
						<input type="text" class="form-control" name="stack_name"
							placeholder="Stack Name" required="required"
							aria-label="Stack Name" aria-describedby="basic-addon1">
					</div>

					<table class="table table-bordered border-primary"
						style="margin-top: 2%; margin-bottom: 2%;">
						<thead>
							<tr class="thead-light">
								<th scope="col">Stack</th>
								<th scope="col">Description</th>
								<th scope="col">VMs</th>
								<th scope="col">Machine type</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">Linux</th>
								<td>Operating System</td>
								<td rowspan="4">1</td>

								<td rowspan="4"><select class="form-control"
									id="machine-type" name="machine_type">
										<option value="n1-standard-1">n1-standard-1</option>
										<option value="n1-standard-2">n1-standard-2</option>
										<option value="n1-standard-4">n1-standard-4</option>
										<option value="n1-standard-8">n1-standard-8</option>
										<option value="n1-standard-16">n1-standard-16</option>
										<option value="n1-standard-32">n1-standard-32</option>
										<option value="n1-standard-64">n1-standard-64</option>
										<option value="n1-standard-96">n1-standard-96</option>

								</select></td>
							</tr>
							<tr>
								<th scope="row">Apache</th>
								<td>Web Server</td>
							</tr>
							<tr>
								<th scope="row">PHP</th>
								<td>Scripting language</td>
							</tr>
							<tr>
								<th scope="row">MySQL</th>
								<td>Database Server</td>

							</tr>
							<tr class="thead-light">
								<th scope="row" colspan="2">Total VMs</th>
								<th colspan="2">1</th>
							</tr>

						</tbody>
					</table>

					Estimated costs: <span class="text-danger"><b>
							$13.61/month</b></span>
				</div>
				<div class="modal-footer">

					<input type="hidden" name="stack" id="stack" value="LAMP" /> <input
						type="hidden" name="builttype" id="builttype" value="stack" />
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Launch</button>

				</div>
			</form>
		</div>
	</div>
</div>



<%-- DevOps modal --%>

<div class="modal fade text-center" id="DevOpsModalStackCenter" tabindex="-1"
	role="dialog" aria-labelledby="DevOpsModalStackCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form id="myForm" action="trigger" method="post">
				<div class="modal-header">
					<h5 class="modal-title text-primary" id="DevOpsModalStackLongTitle">DevOps
						- Stack Summary</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<br>

					<p class="text-primary">
						<b> Target Environment Details</b>
					</p>
					<table class="table table-bordered border-primary"
						style="margin-top: 2%; margin-bottom: 2%;">
						<thead>
							<tr class="thead-light">
								<th scope="col">Organization</th>
								<th scope="col">Project</th>
								<th scope="col">Region</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">No Organisation</th>
								<td>cloudglobaldelivery-1000135575</td>
								<td>us-east1</td>
							</tr>

						</tbody>
					</table>


					<p class="text-primary">
						<b> DevOps Stack Details</b>
					</p>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Stack
								Name</span>
						</div>
						<input type="text" class="form-control" name="stack_name"
							placeholder="Stack Name" required="required"
							aria-label="Stack Name" aria-describedby="basic-addon1">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">GitHub Url</span>
						</div>
						<input type="text" class="form-control" name="github_url"
							placeholder="GitHub Url" required="required"
							aria-label="GitHub Url" aria-describedby="basic-addon1">
					</div>
					
					<table class="table table-bordered border-primary"
						style="margin-top: 2%; margin-bottom: 2%;">
						<thead>
							<tr class="thead-light">
								<th scope="col">Stack</th>
								<th scope="col">Description</th>
								<th scope="col">VM's / Nodes</th>
								<th scope="col">Machine type</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">Jenkins</th>
								<td>CI / CD Tool</td>
								<td>1</td>


								<td rowspan="4"><select class="form-control"
									id="machine-type" name="machine_type">
										<option value="n1-standard-1">n1-standard-1</option>
										<option value="n1-standard-2">n1-standard-2</option>
										<option value="n1-standard-4">n1-standard-4</option>
										<option value="n1-standard-8">n1-standard-8</option>
										<option value="n1-standard-16">n1-standard-16</option>
										<option value="n1-standard-32">n1-standard-32</option>
										<option value="n1-standard-64">n1-standard-64</option>
										<option value="n1-standard-96">n1-standard-96</option>

								</select>
								This will be the machine type for all the 4 VM's, (i.e Jenkins, Harbor, SonarQube & ELK) </td>
								
							</tr>
							<tr>
								<th scope="row">Harbor</th>
								<td>Open source cloud native registry</td>
								<td>1</td>
							</tr>
							<tr>
								<th scope="row">Sonar Qube</th>
								<td>Continuous inspection of code quality tool</td>
								<td>1</td>
							
							</tr>
							<tr>
								<th scope="row">ELK</th>
								<td>Open source log analysis platform</td>
								<td>1</td>
								

							</tr>
							<tr>
								<th scope="row">Kubernetes Cluster</th>
								<td>Container Orchestration System</td>
								<td>1 Cluster (3 Nodes)</td>
								<td>Each node machine type n1-standard-1</td>

							</tr>
							<tr class="thead-light">
								<th scope="row" colspan="2">Total VMs</th>
								<th colspan="2">4 VM's + 1 Kubernetes Cluster (3 Nodes)</th>
							</tr>

						</tbody>
					</table>

					Estimated costs: <span class="text-danger"><b>
							$13.61/month</b></span>
				</div>
				<div class="modal-footer">

					<input type="hidden" name="stack" id="stack" value="devopsstack" /> <input
						type="hidden" name="builttype" id="builttype" value="stack" />
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Launch</button>

				</div>
			</form>
			</div>
	</div>	
</div>


<%-- WordPress modal --%>

<div class="modal fade text-center" id="WPModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="WPModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form id="myForm" action="trigger" method="post">
				<div class="modal-header">
					<h5 class="modal-title text-primary" id="WPModalCenterTitle">WordPress
						- Stack Summary</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<br>

					<p class="text-primary">
						<b> Target Environment Details</b>
					</p>
					<table class="table table-bordered border-primary"
						style="margin-top: 2%; margin-bottom: 2%;">
						<thead>
							<tr class="thead-light">
								<th scope="col">Organization</th>
								<th scope="col">Project</th>
								<th scope="col">Region</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">No Organisation</th>
								<td>cloudglobaldelivery-1000135575</td>
								<td>us-central1</td>
							</tr>

						</tbody>
					</table>


					<p class="text-primary">
						<b> WordPress Stack Details</b>
					</p>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Stack
								Name</span>
						</div>
						<input type="text" class="form-control" name="stack_name"
							placeholder="Stack Name" required="required"
							aria-label="Stack Name" aria-describedby="basic-addon1">
					</div>
					<table class="table table-bordered border-primary"
						style="margin-top: 2%; margin-bottom: 2%;">
						<thead>
							<tr class="thead-light">
								<th scope="col">Stack</th>
								<th scope="col">Description</th>
								<th scope="col">VMs</th>
								<th scope="col">Machine type</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">WordPress</th>
								<td>WordPress is a content management system based on PHP and MySQL</td>
								<td rowspan="5">1</td>


								<td rowspan="3"><select class="form-control"
									id="machine-type" name="machine_type">
										<option value="n1-standard-1">n1-standard-1</option>
										<option value="n1-standard-2">n1-standard-2</option>
										<option value="n1-standard-4">n1-standard-4</option>
										<option value="n1-standard-8">n1-standard-8</option>
										<option value="n1-standard-16">n1-standard-16</option>
										<option value="n1-standard-32">n1-standard-32</option>
										<option value="n1-standard-64">n1-standard-64</option>
										<option value="n1-standard-96">n1-standard-96</option>

								</select></td>
							</tr>
							<tr>
								<th scope="row">Cloud SQL</th>
								<td>Cloud SQL is a fully-managed database service that makes it easy to set up, maintain, manage, and administer your relational databases on Google Cloud Platform. </td>
							</tr>
						
							<tr>
								<th scope="row">ELK</th>
								<td>Open source log analysis platform</td>

							</tr>
						
							<tr class="thead-light">
								<th scope="row" colspan="3">Total VMs</th>
								<th colspan="1">2 VM's + 1 Cloud SQL (MySQL)</th>
							</tr>

						</tbody>
					</table>

					Estimated costs: <span class="text-danger"><b>
							$13.61/month</b></span>
				</div>
				<div class="modal-footer">

					<input type="hidden" name="stack" id="stack" value="wordpress" /> <input
						type="hidden" name="builttype" id="builttype" value="stack" />
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Launch</button>

				</div>
			</form>
			</div>
	</div>	
</div>






