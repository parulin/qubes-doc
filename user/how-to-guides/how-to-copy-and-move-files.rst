=====================================================
How to copy, move, open or edit files in another qube
=====================================================

.. note::

   If you wish to simply copy and paste text, or copy from dom0, see:

   * :doc:`/user/how-to-guides/how-to-copy-and-move-files`
   * :doc:`/user/how-to-guides/how-to-copy-from-dom0`

Qubes OS supports various operations on files and directories (or "folders") between qubes:

* copying or moving files and directories from a qube to another
* opening a file from a qube in another, then potentially keeping the changes

In the following examples, the *work* qube will be our source qube and *personal* our target qube.

How to initiate an operation in another qube with a file manager
----------------------------------------------------------------

1. Open a file manager in the source qube (i.e.:  *work*): the qube containing the file you wish to use

2. Open the context menu of the file you wish to use, using right-click, :kbd:`Menu` or :kbd:`Shift` + :kbd:`F10`.

3. Select one of:

   * :guilabel:`Copy to other qube` (possible with multiple files and folders, recursively)
   * :guilabel:`Move to other qube` (possible with multiple files and folders, recursively)
   * :guilabel:`Open in other qube`
   * :guilabel:`Edit in disposable qube`
   * :guilabel:`Open in disposable qube`

   .. figure:: /attachment/doc/move-file-context-menu.svg

      In *work*, open the context menu of our :file:`test.txt` file

4. **(optional)** A dialog box will appear in dom0 asking for the name of the target qube (i.e.:*personal*). Enter or select the desired destination qube name and click on :guilabel:`Ok`.

   .. figure:: /attachment/doc/move-file-popup.svg

      The dialog of *dom0* waits for confirmation

      There is a reminder of the :guilabel:`Source` qube (here: *work*), the operation (here: *qubes.Filecopy*, but it could be *qubes.OpenInVM*) and a dropdown selector to choose the :guilabel:`Target` qube (here: *personal*)

5. **(optional)** If the target qube is not already running, it will be started automatically

6. The operation on the file will be run on the target qube

Result of the different operations
----------------------------------

Depending on the selected operation and qube, the result is different:

After a copy
^^^^^^^^^^^^

After a **copy**: the file will be present in both qubes.

It will show up in a defined directory: :file:`/home/user/QubesIncoming/{<SOURCE_QUBE>}/{<FILENAME>}`. This directory will automatically be created if it does not already exist.

.. figure:: /attachment/doc/moved-files-qubesincoming.svg

   The file is in :menuselection:`QubesIncoming --> work`

.. note::

   The operation will fail if you try to copy a file called :file:`text.txt` from a *work* qube and if the file (:file:`/home/user/QubesIncoming/{work}/{text.txt}`) already exists in the destination qube (i.e.: *personal*).

If you wish, you may now move the file in the target qube to a different directory. The directory :file:`/home/user/QubesIncoming/{work}` will be automatically deleted if empty. If you wish, you may now delete the :file:`QubesIncoming/` directory.

After a move
^^^^^^^^^^^^

A move operation is almost like a copy. Moving a file is equivalent to copying the file, then deleting the original. So, after moving the file successfully, it will be deleted from the source qube.

.. figure:: /attachment/doc/moved-file-check.svg

   After a move operation, :file:`test.txt` is deleted from *work*

After opening in other qube
^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you have just opened the file in another qube, it will be copied in a temporary directory (:file:`/tmp/`<SOURCE_QUBE>}`) on the target qube. Once the file is closed, it will be removed from the target qube. If you have edited the file while using the :guilabel:`Open in disposable qube` option, it will be lost because the disposable will be closed.

After editing in other qube
^^^^^^^^^^^^^^^^^^^^^^^^^^^

After editing the file in a qube or in a disposable (with the :guilabel:`Edit in disposable qube` option), the original file in the source qube will be edited too.

.. danger::

   Keep in mind that performing a transfer from a *less trusted* qube to a *more trusted* qube is :ref:`always potentially insecure <qfilecopy-security>` if the data will be parsed in the target qube.


How to copy or move a file in another qube in a terminal
--------------------------------------------------------

The same operations are also available via these command-line tools:

To copy a file
   .. code:: console

         [user@SOURCE_QUBE] $ qvm-copy <PATH_OF_THE_FILE>
         Sent 1234/1234KB

To move two files
   .. code:: console

         [user@SOURCE_QUBE] $ qvm-move <PATH_OF_THE_FILE1> <PATH_OF_THE_FILE2>
         Sent 1234/1234KB

To open a file in a qube
   .. code:: console

         [user@SOURCE_QUBE] $ qvm-open-in-vm <TARGET_QUBE> <PATH_OF_THE_FILE>

To open a file in a new disposable
   .. code:: console

         [user@SOURCE_QUBE] $ qvm-open-in-dvm --view-only <TARGET_QUBE> <PATH_OF_THE_FILE>

To edit a file in a new disposable
   .. code:: console

         [user@SOURCE_QUBE] $ qvm-open-in-dvm <PATH_OF_THE_FILE>
