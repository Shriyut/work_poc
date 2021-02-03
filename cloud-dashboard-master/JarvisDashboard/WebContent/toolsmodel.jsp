<%-- DevOps modal --%>

<div class="modal fade text-center" id="DevOpsModalToolsCenter" tabindex="1"
	role="dialog" aria-labelledby="DevOpsModalToolsCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form id="myForm" action="trigger" method="post">
				<div class="modal-header">
					<h5 class="modal-title text-primary" id="DevOpsModalToolsLongTitle">DevOps
						Tools - Summary</h5>
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
						<b> DevOps Tool Details</b>
					</p>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Tools
								Name</span>
						</div>
						<input type="text" class="form-control" name="tool_name"
							placeholder="Tool Name" required="required"
							aria-label="Tool Name" aria-describedby="basic-addon1">
					</div>
					<table class="table table-bordered border-primary"
						style="margin-top: 2%; margin-bottom: 2%;">
						<thead>
							<tr class="thead-light">
								<th scope="col">Required</th>
								<th scope="col">Tools</th>
								<th scope="col">Description</th>
								<th scope="col">VMs</th>
								<th scope="col">Machine Type</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" name="tools" value="SonarQube" />&nbsp;</td>
								<th scope="row">SonarQube</th>
								<td>Catch bugs and vulnerabilities</td>
								<td rowspan="1">1</td>
								<td rowspan="4">n1-standard-1</td>


							</tr>


							<tr>
								<td><input type="checkbox" name="tools" value="Maven" />&nbsp;</td>
								<th scope="row">Maven</th>
								<td>Project management and comprehension tool</td>
								<td rowspan="1">1</td>


							</tr>
							<tr>
								<td><input type="checkbox" name="tools" value="Harbor" />&nbsp;</td>
								<th scope="row">Harbor</th>
								<td>Cloud native registry</td>

								<td rowspan="1">1</td>

							</tr>
							<tr>
								<td><input type="checkbox" name="tools" value="Jenkins" />&nbsp;</td>
								<th scope="row">Jenkins</th>
								<td>Automation Server</td>
								<td rowspan="1">1</td>

							</tr>
							<tr class="thead-light">
								<th scope="row" colspan="3"></th>
								<th colspan="3"></th>
							</tr>

						</tbody>
					</table>

					Estimated costs: <span class="text-danger"><b>
							$13.61/month</b></span>
				</div>
				<div class="modal-footer">

					<input type="hidden" name="builttype" id="builttype" value="tools" />
					<input type="hidden" name="tool" id="tool" value="DevOps" />
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-primary">Launch</button>

				</div>
			</form>
		</div>
	</div>
</div>

