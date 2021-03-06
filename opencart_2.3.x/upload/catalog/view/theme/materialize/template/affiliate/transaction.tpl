<?php echo $header; ?>
<script type="application/ld+json">
	{
		"@context": "http://schema.org",
		"@type": "BreadcrumbList",
		"itemListElement": [
			<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
			<?php $i++ ?>
			<?php if ($i < count($breadcrumbs)) { ?>
			<?php if ($i == 1) {?>
			<?php } else {?>
			{
				"@type": "ListItem",
				"position": <?php echo ($i-1); ?>,
				"item": {
					"@id": "<?php echo $breadcrumb['href']; ?>",
					"name": "<?php echo $breadcrumb['text']; ?>"
				}
			},
			<?php }?>
			<?php } else { ?>
			{
				"@type": "ListItem",
				"position": <?php echo ($i-1); ?>,
				"item": {
					"@id": "<?php echo $breadcrumb['href']; ?>",
					"name": "<?php echo $breadcrumb['text']; ?>"
				}
			}
			<?php }}?>
		]
	}
</script>
	<main>
		<div class="container">
			<nav id="breadcrumbs" class="breadcrumb-wrapper transparent z-depth-0">
				<div class="nav-wrapper breadcrumb-wrap href-underline">
					<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
					<?php $i++ ?>
					<?php if ($i < count($breadcrumbs)) { ?>
					<?php if ($i == 1) {?>
						<a href="<?php echo $breadcrumb['href']; ?>" class="breadcrumb waves-effect black-text"><i class="material-icons">home</i></a>
					<?php } else {?>
						<a href="<?php echo $breadcrumb['href']; ?>" class="breadcrumb waves-effect black-text"><?php echo $breadcrumb['text']; ?></a>
					<?php }?>
					<?php } else { ?>
						<span class="breadcrumb blue-grey-text text-darken-3"><?php echo $breadcrumb['text']; ?></span>
					<?php }}?>
				</div>
			</nav>
			<h1><?php echo $heading_title; ?></h1>
			<?php if ($column_left && $column_right) { ?>
				<?php $main = 's12 l6'; ?>
			<?php } elseif ($column_left || $column_right) { ?>
				<?php $main = 's12 l9'; ?>
			<?php } else { ?>
				<?php $main = 's12'; ?>
			<?php } ?>
			<div class="row">
				<?php echo $column_left; ?>
				<div id="content" class="col <?php echo $main; ?>">
					<?php echo $content_top; ?>
						<div class="card-panel">
							<p><?php echo $text_balance; ?> <strong><?php echo $balance; ?></strong>.</p>
							<div class="divider"></div>
							<table class="bordered striped highlight centered responsive-table">
								<thead>
									<tr>
										<th><?php echo $column_date_added; ?></th>
										<th><?php echo $column_description; ?></th>
										<th><?php echo $column_amount; ?></th>
									</tr>
								</thead>
								<tbody>
									<?php if ($transactions) { ?>
									<?php foreach ($transactions  as $transaction) { ?>
									<tr>
										<td><?php echo $transaction['date_added']; ?></td>
										<td><?php echo $transaction['description']; ?></td>
										<td><?php echo $transaction['amount']; ?></td>
									</tr>
									<?php } ?>
									<?php } else { ?>
									<tr>
										<td colspan="3"><?php echo $text_empty; ?></td>
									</tr>
									<?php } ?>
								</tbody>
							</table>
							<?php if($pagination) { ?>
							<div class="row href-underline">
								<?php echo $pagination; ?>
							</div>
							<?php } ?>
						</div>
						<div class="flex-reverse href-underline">
							<a href="<?php echo $continue; ?>" class="btn waves-effect waves-light red"><?php echo $button_continue; ?></a>
						</div>
						<?php echo $content_bottom; ?>
					</div>
					<?php echo $column_right; ?>
				</div>
			</div>
		</div>
	</main>
<?php echo $footer; ?>