
<h3> You have a new message</h3>

<table rules="all" style="border-color: #666;" cellpadding="10">
    <tr><th style='border:1px solid #d1d1d1;background:#f1f1f1;'>Customer's name:</th>
        <td style='border:1px solid #d1d1d1;'><?php echo $POST['name']; ?></td></tr>
    <tr><th style='border:1px solid #d1d1d1;background:#f1f1f1;'>Customer's email:</th>
        <td style='border:1px solid #d1d1d1'><?php echo $POST['email']; ?></td><tr>
    <tr><th style='border:1px solid #d1d1d1;background:#f1f1f1;'>Customer's message:</th>
        <td style='border:1px solid #d1d1d1'><?php echo $POST['msg']; ?></td><tr>
</table>