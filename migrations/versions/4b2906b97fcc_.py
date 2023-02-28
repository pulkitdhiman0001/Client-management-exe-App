"""empty message

Revision ID: 4b2906b97fcc
Revises: 2d0188fcb1be
Create Date: 2023-02-14 18:43:00.857569

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '4b2906b97fcc'
down_revision = '2d0188fcb1be'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('sales_order', schema=None) as batch_op:
        batch_op.add_column(sa.Column('total_paid', sa.Float(), nullable=True))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('sales_order', schema=None) as batch_op:
        batch_op.drop_column('total_paid')

    # ### end Alembic commands ###
