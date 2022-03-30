<div class="container pt-4 ">
    <div class="col-lg-12">
        <div class="container-fluid">
                <div class="card">
                    <div class="card-body">
                        <div class="fr-view">
                            <?php echo isset($_SESSION['system']['about_content']) ? html_entity_decode($_SESSION['system']['about_content']) : '' ?>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</div>